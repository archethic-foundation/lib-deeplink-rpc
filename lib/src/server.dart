/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';
import 'dart:convert';

import 'package:deeplink_rpc/deeplink_rpc.dart';
import 'package:deeplink_rpc/src/codec.dart';
import 'package:deeplink_rpc/src/url_launcher.dart';
import 'package:logging/logging.dart';
import 'package:stream_channel/stream_channel.dart';

// /request_endpoint/H4sIAMMDNmcA/03LQQ7CIBCF4bvMWqQgqHAKN67NKGPSBCmFtolpeneJkOjuzeT/VugdWFBnZzqFR6ZIaKZQd+zeHZ5MO+NInCQqYWAHicaZ8nRNvphMaaGEMVrO696Xg7fmRsHFoQ/Tl0X/rujhewpTRXU3VIp/EjHhK4Ndm7ikIYriF/QziRL83hKs3LYPvnywZskAAAA=
// /request_endpoint/H4sIAN8ENmcA_03LwQoCIRDG8XeZcyZuSa5P0aVzuDqBYK6N7kIs--5JCnX7Zvj_NvAONDhjpZokMinQsbMQJ2Yuo2OjFY9JOasGi3AAwteCudwoVJORViSTkua87WM9eG_uGF2afSxflsK7IRs8xtJQ2x3V4p8kQ-aZQW9dXGlOovrVhAVFDX7vAfSw7x9qXXzsyQAAAA==
/// Receives and decodes DeeplinkRpcRequests.
class DeeplinkRpcServer {
  DeeplinkRpcServer({
    UrlLauncher? urlLauncher,
    DeeplinkRpcCodec? codec,
    required this.onReceive,
  })  : codec = codec ?? const DeeplinkRpcCodec(),
        urlLauncher = urlLauncher ?? const UrlLauncher();

  final DeeplinkRequestHandler onReceive;

  static final _logger = Logger('DeeplinkRpcRequest');
  final UrlLauncher urlLauncher;
  final DeeplinkRpcCodec codec;

  Future<void> receive(Uri uri) async {
    final data = _getData(uri);
    if (data == null) {
      // return const DeeplinkRpcResult.failure(
      //   failure: DeeplinkRpcFailure(
      //     code: DeeplinkRpcFailure.kInvalidRequest,
      //     message: 'Failed to extract data from path',
      //   ),
      // );
      // TODO(Chralu): Handle error here
      return;
    }
    final request = _decodeRequest(data);
    await onReceive(
      request,
      (result) async {
        await _sendReply(request, result);
      },
    );
  }

  Future<void> _sendReply(
    DeeplinkRpcRequest request,
    Map<String, dynamic> result,
  ) async {
    final replyUri = Uri.parse(request.replyUrl);

    await urlLauncher.launchUrl(
      Uri(
        scheme: replyUri.scheme,
        host: replyUri.host,
        port: replyUri.port,
        path: replyUri.path,
        fragment: replyUri.fragment,
        queryParameters: {
          DeeplinkRpcResponse.dataParameter: codec.encode(result),
        },
      ),
      logger: _logger,
    );
  }

  /// Extracts data payload from the path.
  static String? _getData(Uri? path) {
    if (path == null) return null;

    return path.queryParameters[DeeplinkRpcRequest.dataParameter];
  }

  DeeplinkRpcRequest _decodeRequest(
    String data,
  ) {
    return DeeplinkRpcRequest.fromJson(
      codec.decode(data),
    );
  }
}

typedef DeeplinkReplySend = Future<void> Function(Map<String, dynamic> result);
typedef DeeplinkRequestHandler = FutureOr<void> Function(
  DeeplinkRpcRequest request,
  DeeplinkReplySend sendReply,
);

class DeeplinRPCServerStreamChannel
    with StreamChannelMixin<String>
    implements StreamChannel<String> {
  DeeplinRPCServerStreamChannel({
    required DeeplinkReplySend sendReply,
    required DeeplinkRpcRequest request,
  }) {
    _in.add(jsonEncode(request.payload));

    _out.onCancel = close;

    _out.stream.first.then(
      (value) async {
        final result = jsonDecode(value);
        logger.info('Wallet response sent $value');
        await sendReply(result);
        await close();
      },
    );
  }

  final logger = Logger('Browser RPC Server - StreamChannel');

  Future<void> close() async {
    logger.info('Wallet releases port');

    _out.onCancel = null;
    await _outSubscription.cancel();
    await _out.close();

    await _in.close();
    logger.info('Wallet releases done');
  }

  final _in = StreamController<String>(sync: true);
  late StreamSubscription _outSubscription;
  final _out = StreamController<String>(sync: true);

  @override
  StreamSink<String> get sink => _out.sink;

  @override
  Stream<String> get stream => _in.stream;
}

class DeeplinRPCServerStreamChannel2
    with StreamChannelMixin<String>
    implements StreamChannel<String> {
  DeeplinRPCServerStreamChannel2() {
    server = DeeplinkRpcServer(
      onReceive: (request, sendReply) {
        _in.add(jsonEncode(request.payload));
        final requestId = request.payload['id'];
        if (requestId == null) return;
        _requests[requestId] = sendReply;
      },
    );
    _out.stream.listen(
      (value) async {
        final result = jsonDecode(value);

        final sendReply = _requests[result['id']];
        if (sendReply == null) return;
        logger.info('Wallet response sent $value');

        await sendReply(result);
      },
    );

    _out.onCancel = close;
  }

  final Map<int, DeeplinkReplySend> _requests = {};

  late final DeeplinkRpcServer server;
  final logger = Logger('Browser RPC Server - StreamChannel');

  Future<void> close() async {
    logger.info('Wallet releases port');

    _out.onCancel = null;
    await _outSubscription.cancel();
    await _out.close();

    await _in.close();
    logger.info('Wallet releases done');
  }

  final _in = StreamController<String>(sync: true);
  late StreamSubscription _outSubscription;
  final _out = StreamController<String>(sync: true);

  @override
  StreamSink<String> get sink => _out.sink;

  @override
  Stream<String> get stream => _in.stream;
}
