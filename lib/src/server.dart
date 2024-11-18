/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:deeplink_rpc/src/codec.dart';
import 'package:deeplink_rpc/src/data/failure.dart';
import 'package:deeplink_rpc/src/data/request.dart';
import 'package:deeplink_rpc/src/data/response.dart';
import 'package:deeplink_rpc/src/data/result.dart';
import 'package:deeplink_rpc/src/handler.dart';
import 'package:deeplink_rpc/src/receiver.dart';
import 'package:deeplink_rpc/src/url_launcher.dart';
import 'package:logging/logging.dart';

// /request_endpoint/H4sIAMMDNmcA/03LQQ7CIBCF4bvMWqQgqHAKN67NKGPSBCmFtolpeneJkOjuzeT/VugdWFBnZzqFR6ZIaKZQd+zeHZ5MO+NInCQqYWAHicaZ8nRNvphMaaGEMVrO696Xg7fmRsHFoQ/Tl0X/rujhewpTRXU3VIp/EjHhK4Ndm7ikIYriF/QziRL83hKs3LYPvnywZskAAAA=
// /request_endpoint/H4sIAN8ENmcA_03LwQoCIRDG8XeZcyZuSa5P0aVzuDqBYK6N7kIs--5JCnX7Zvj_NvAONDhjpZokMinQsbMQJ2Yuo2OjFY9JOasGi3AAwteCudwoVJORViSTkua87WM9eG_uGF2afSxflsK7IRs8xtJQ2x3V4p8kQ-aZQW9dXGlOovrVhAVFDX7vAfSw7x9qXXzsyQAAAA==
/// Receives and decodes DeeplinkRpcRequests.
class DeeplinkRpcServer
    extends BaseDeeplinkRpcReceiver<DeeplinkRpcRequestHandler> {
  DeeplinkRpcServer({
    UrlLauncher? urlLauncher,
    DeeplinkRpcCodec? codec,
  })  : codec = codec ?? const DeeplinkRpcCodec(),
        urlLauncher = urlLauncher ?? const UrlLauncher();

  static final _logger = Logger('DeeplinkRpcRequest');
  final UrlLauncher urlLauncher;
  final DeeplinkRpcCodec codec;

  Future<DeeplinkRpcResult> _handle(Uri uri) async {
    try {
      _logger.info(
        'Handles RPC call',
      );

      final data = DeeplinkRpcRoute.getData(uri);
      if (data == null) {
        return const DeeplinkRpcResult.failure(
          failure: DeeplinkRpcFailure(
            code: DeeplinkRpcFailure.kInvalidRequest,
            message: 'Failed to extract data from path',
          ),
        );
      }
      final request = _decodeRequest(data);

      final handler = handlerForPath(uri);
      if (handler == null) {
        return DeeplinkRpcResult.failure(
          request: request,
          failure: DeeplinkRpcFailure(
            data: request,
            code: DeeplinkRpcFailure.kInvalidRequest,
            message: 'No handler for path $uri',
          ),
        );
      }

      try {
        final result = await handler.handle(request);

        _logger.info(
          'RPC call handled',
        );
        return DeeplinkRpcResult.success(
          request: request,
          result: result,
        );
      } catch (e) {
        if (e is DeeplinkRpcFailure) {
          return DeeplinkRpcResult.failure(
            failure: e,
            request: request,
          );
        }
        return DeeplinkRpcResult.failure(
          failure: const DeeplinkRpcFailure(
            code: DeeplinkRpcFailure.kServerError,
          ),
          request: request,
        );
      }
    } catch (e, stack) {
      _logger.severe(
        'An error occured',
        e,
        stack,
      );
      return const DeeplinkRpcResult.failure(
        failure: DeeplinkRpcFailure(
          code: DeeplinkRpcFailure.kServerError,
        ),
      );
    }
  }

  Future<void> handle(Uri uri) async {
    final result = await _handle(uri);

    final request = result.request;
    final response = result.toResponse();
    if (request == null || response == null) {
      _logger.warning(
        'Impossible to send RPC result back',
        response?.failure,
      );
      return;
    }

    final replyUri = Uri.parse(request.replyUrl);

    await urlLauncher.launchUrl(
      Uri(
        scheme: replyUri.scheme,
        host: replyUri.host,
        path: replyUri.path,
        queryParameters: {
          DeeplinkRpcRoute.dataParameter: _encodeResponse(response),
        },
      ),
      logger: _logger,
    );
  }

  DeeplinkRpcRequest _decodeRequest(
    Object? argument,
  ) {
    if (argument is! String) {
      throw const DeeplinkRpcFailure(code: DeeplinkRpcFailure.kInvalidRequest);
    }

    return DeeplinkRpcRequest.fromJson(
      codec.decode(argument),
    );
  }

  String _encodeResponse(DeeplinkRpcResponse response) =>
      codec.encode(response.toJson());
}
