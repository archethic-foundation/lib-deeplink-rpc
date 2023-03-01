/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';
import 'dart:ui';

import 'package:deeplink_rpc/deeplink_rpc.dart';
import 'package:url_launcher/url_launcher.dart';

class _RunningRequest {
  _RunningRequest({
    required Duration timeout,
    required VoidCallback onTimeout,
  }) : timer = Timer(
          timeout,
          onTimeout,
        );
  final completer = Completer<DeeplinkRpcResponse>();
  final Timer? timer;
}

class DeeplinkRpcClient {
  DeeplinkRpcClient() {
    _deeplinkRpcReceiver = DeeplinkRpcResponseReceiver();
  }
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
    Duration timeout = const Duration(minutes: 2),
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
    if (!await canLaunchUrl(url)) {
      return DeeplinkRpcResponse.failure(
        id: request.id,
        failure: const DeeplinkRpcFailure(
          code: DeeplinkRpcFailure.kConnectivityIssue,
          message: 'Deeplink RPC not responding.',
        ),
      );
    }

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
