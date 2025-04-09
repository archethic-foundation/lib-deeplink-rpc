/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';
import 'dart:convert';

import 'package:deeplink_rpc/deeplink_rpc.dart';
import 'package:deeplink_rpc/src/codec.dart';
import 'package:deeplink_rpc/src/url_launcher.dart';
import 'package:logging/logging.dart';
import 'package:stream_channel/stream_channel.dart';

class DeeplinkRpcClient {
  DeeplinkRpcClient({
    UrlLauncher? urlLauncher,
    DeeplinkRpcCodec? codec,
    required this.messageHandler,
  })  : _codec = codec ?? const DeeplinkRpcCodec(),
        _urlLauncher = urlLauncher ?? const UrlLauncher();

  final UrlLauncher _urlLauncher;
  final DeeplinkRpcCodec _codec;
  final _logger = Logger('DeeplinkRPCClient');

  final DeeplinkResponseHandler messageHandler;

  Future<void> handleResponse(Uri uri) async {
    await messageHandler(_decodeResponse(uri) ?? {});
  }

  Future<void> send(DeeplinkRpcRequest request) async {
    final rawRequestUri = Uri.parse(request.requestUrl);

    final requestUri = Uri(
      scheme: rawRequestUri.scheme,
      host: rawRequestUri.host,
      port: rawRequestUri.port,
      path: rawRequestUri.path,
      fragment: rawRequestUri.fragment,
      queryParameters: {
        DeeplinkRpcRequest.dataParameter: _encodeRequest(request),
      },
    );

    _logger.fine('Attempt to send request $requestUri');

    final launchSucceed = await _urlLauncher.launchUrl(
      requestUri,
      logger: _logger,
    );
    if (!launchSucceed) {
      throw DeeplinkRpcFailure(
        request: request,
        code: DeeplinkRpcFailure.kConnectivityIssue,
        message: 'Unable to launch deeplink',
      );
    }
  }

  Map<String, dynamic>? _decodeResponse(
    Uri? path,
  ) {
    final data = path?.queryParameters[DeeplinkRpcResponse.dataParameter];
    if (data == null) return null;

    return _codec.decode(data);
  }

  String _encodeRequest(DeeplinkRpcRequest request) =>
      _codec.encode(request.toJson());
}

typedef DeeplinkResponseHandler = FutureOr<void> Function(
  Map<String, dynamic> response,
);

class DeeplinRPCClientStreamChannel
    with StreamChannelMixin<String>
    implements StreamChannel<String> {
  DeeplinRPCClientStreamChannel({
    required this.serverUrl,
    required this.clientUrl,
  }) {
    client = DeeplinkRpcClient(
      messageHandler: (payload) {
        _in.add(jsonEncode(payload));
      },
    );

    _out.onCancel = close;

    _outSubscription = _out.stream.listen((event) async {
      logger.info('Wallet response sent $event');

      await client.send(
        DeeplinkRpcRequest(
          requestUrl: serverUrl,
          replyUrl: clientUrl,
          payload: jsonDecode(event),
        ),
      );
    });
  }

  static final logger = Logger('Browser RPC Server - StreamChannel');

  Future<void> close() async {
    logger.info('Wallet releases port');

    _out.onCancel = null;
    await _outSubscription.cancel();
    await _out.close();

    await _in.close();
    logger.info('Wallet releases done');
  }

  final String serverUrl;
  final String clientUrl;
  late final DeeplinkRpcClient client;
  final _in = StreamController<String>(sync: true);
  late StreamSubscription _outSubscription;
  final _out = StreamController<String>(sync: true);

  @override
  StreamSink<String> get sink => _out.sink;

  @override
  Stream<String> get stream => _in.stream;
}
