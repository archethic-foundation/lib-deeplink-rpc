/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';
import 'dart:ui';

import 'package:deeplink_rpc/deeplink_rpc.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';

class _RunningRequest {
  _RunningRequest({
    Duration? timeout,
    required VoidCallback onTimeout,
  }) {
    if (timeout != null) {
      timer = Timer(
        timeout,
        onTimeout,
      );
    }
  }
  final completer = Completer<DeeplinkRpcResponse>();
  late final Timer? timer;
}

class DeeplinkRpcClient {
  DeeplinkRpcClient() {
    _deeplinkRpcReceiver = DeeplinkRpcResponseReceiver();
  }

  final _logger = Logger('DeeplinkRPCClient');
  late final _runningRequests = <String, _RunningRequest>{};

  late final DeeplinkRpcResponseReceiver _deeplinkRpcReceiver;

  void _registerResponseHandler(DeeplinkRpcRequest request) {
    _deeplinkRpcReceiver.registerHandler(
      DeeplinkRpcResponseHandler(
        route: DeeplinkRpcRoute(Uri.parse(request.replyUrl).pathSegments.first),
        handle: _completeRequest,
      ),
    );
  }

  void _completeRequest(DeeplinkRpcResponse response) {
    _logger.fine('Request completed $response');

    final runningRequest = _runningRequests[response.id];

    if (runningRequest == null) return;

    runningRequest.completer.complete(response);

    _runningRequests.remove(response.id);
  }

  bool handleRoute(String? path) {
    if (!_deeplinkRpcReceiver.canHandle(path)) return false;

    unawaited(_deeplinkRpcReceiver.handle(path));
    return true;
  }

  Future<DeeplinkRpcResponse> send({
    required DeeplinkRpcRequest request,
    Duration? timeout,
  }) async {
    if (_runningRequests.containsKey(request.id)) {
      return DeeplinkRpcResponse.failure(
        id: request.id,
        failure: DeeplinkRpcFailure(
          code: DeeplinkRpcFailure.kInvalidRequest,
          message: 'A request with id ${request.id} already running.',
        ),
      );
    }

    final url = Uri.parse('${request.requestUrl}/${request.encode()}');

    _logger.fine('Attempt to send request $url');

    _registerResponseHandler(request);

    final runningRequest = _RunningRequest(
      timeout: timeout,
      onTimeout: () {
        _completeRequest(
          DeeplinkRpcResponse.failure(
            id: request.id,
            failure: const DeeplinkRpcFailure(
              code: DeeplinkRpcFailure.kTimeout,
              message: 'Request timeout.',
            ),
          ),
        );
      },
    );
    _runningRequests[request.id] = runningRequest;

    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );

    return runningRequest.completer.future;
  }
}
