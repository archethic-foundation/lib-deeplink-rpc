/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:deeplink_rpc/src/data/failure.dart';
import 'package:deeplink_rpc/src/data/request.dart';
import 'package:deeplink_rpc/src/data/response.dart';
import 'package:deeplink_rpc/src/data/result.dart';
import 'package:deeplink_rpc/src/handler.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class BaseDeeplinkRpcReceiver<T extends DeeplinkRpcHandler> {
  final Set<T> _routeHandlers = {};

  static final _logger = Logger('DeeplinkRPC');

  T? _handlerForPath(String? path) {
    if (path == null) return null;
    return _routeHandlers.cast<T?>().firstWhere(
          (handler) => handler?.route.matches(path) ?? false,
          orElse: () => null,
        );
  }

  void registerHandler(T handler) {
    if (_routeHandlers.contains(handler)) {
      _logger.info(
        'A route handler is already registered for ${handler.route.pathFirstSegment}',
      );
      return;
    }
    _routeHandlers.add(handler);
  }

  bool canHandle(String? path) {
    if (path == null) return false;

    return _handlerForPath(path) != null;
  }
}

/// Receives and decodes DeeplinkRpcRequests.
class DeeplinkRpcRequestReceiver
    extends BaseDeeplinkRpcReceiver<DeeplinkRpcRequestHandler> {
  DeeplinkRpcRequestReceiver();

  static final _logger = Logger('DeeplinkRpcRequest');

  Future<DeeplinkRpcResult> _handle(String? path) async {
    try {
      _logger.info(
        'Handles RPC call',
      );

      final handler = _handlerForPath(path);
      if (handler == null) {
        return DeeplinkRpcResult.failure(
          failure: DeeplinkRpcFailure(
            code: DeeplinkRpcFailure.kInvalidRequest,
            message: 'No handler for path $path',
          ),
        );
      }

      final data = handler.route.getData(path);

      if (data == null) {
        return const DeeplinkRpcResult.failure(
          failure: DeeplinkRpcFailure(
            code: DeeplinkRpcFailure.kInvalidRequest,
            message: 'Failed to extract data from path',
          ),
        );
      }

      final request = DeeplinkRpcRequest.decode(data);

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

  Future<void> handle(String? path) async {
    final result = await _handle(path);

    final request = result.request;
    final response = result.toResponse();
    if (request == null || response == null) {
      _logger.info(
        'Impossible to send RPC result back',
      );
      return;
    }

    await launchUrl(Uri.parse('${request.replyUrl}/${response.encode()}'));
  }
}

/// Receives and decodes DeeplinkRpcRequests.
class DeeplinkRpcResponseReceiver
    extends BaseDeeplinkRpcReceiver<DeeplinkRpcResponseHandler> {
  DeeplinkRpcResponseReceiver();

  static final _logger = Logger('DeeplinkRpcResponse');

  Future<void> handle(String? path) async {
    try {
      _logger.info(
        'Handles RPC response',
      );

      final handler = _handlerForPath(path);
      if (handler == null) {
        throw DeeplinkRpcFailure(
          code: DeeplinkRpcFailure.kInvalidRequest,
          message: 'No handler for path $path',
        );
      }

      final data = handler.route.getData(path);

      if (data == null) {
        throw const DeeplinkRpcFailure(
          code: DeeplinkRpcFailure.kInvalidRequest,
          message: 'Failed to extract data from path',
        );
      }

      final response = DeeplinkRpcResponse.decode(data);

      await handler.handle(response);

      _logger.info(
        'RPC call handled',
      );
    } catch (e, stack) {
      _logger.info(
        'An error occured',
        e,
        stack,
      );
      throw const DeeplinkRpcResult.failure(
        failure: DeeplinkRpcFailure(
          code: DeeplinkRpcFailure.kServerError,
        ),
      );
    }
  }
}
