/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';
import 'dart:developer';

import 'package:deeplink_rpc/src/data/request.dart';
import 'package:deeplink_rpc/src/data/response.dart';
import 'package:deeplink_rpc/src/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'handler.freezed.dart';

/// Route receiving a Deeplink
///
/// Deeplink path follows the format '/<parametrable_path_prefix>?<base64_payload>'
@freezed
class DeeplinkRpcRoute with _$DeeplinkRpcRoute {
  const factory DeeplinkRpcRoute(
    String path,
  ) = _DeeplinkRpcRoute;
  const DeeplinkRpcRoute._();

  static const dataParameter = 'rd';

  /// Does the path match the Route.
  bool matches(Uri uri) {
    final matches = uri.path.strip('/') == path.strip('/');
    log('Does $uri matches $path ? $matches');
    return matches;
  }

  /// Extracts data payload from the path.
  static String? getData(Uri? path) {
    if (path == null) return null;

    return path.queryParameters[dataParameter];
  }
}

abstract class DeeplinkRpcHandler {
  DeeplinkRpcRoute get route;
}

@freezed
class DeeplinkRpcRequestHandler
    with _$DeeplinkRpcRequestHandler
    implements DeeplinkRpcHandler {
  const factory DeeplinkRpcRequestHandler({
    required DeeplinkRpcRoute route,
    required FutureOr<Map<String, dynamic>> Function(DeeplinkRpcRequest request)
        handle,
  }) = _DeeplinkRpcRequestHandler;
  const DeeplinkRpcRequestHandler._();
}

@freezed
class DeeplinkRpcResponseHandler
    with _$DeeplinkRpcResponseHandler
    implements DeeplinkRpcHandler {
  const factory DeeplinkRpcResponseHandler({
    required DeeplinkRpcRoute route,
    required FutureOr<void> Function(DeeplinkRpcResponse response) handle,
  }) = _DeeplinkRpcResponseHandler;
  const DeeplinkRpcResponseHandler._();
}
