/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request.freezed.dart';
part 'request.g.dart';

/// RPC request received through Deeplink.
@freezed
class DeeplinkRpcRequest with _$DeeplinkRpcRequest {
  factory DeeplinkRpcRequest({
    required String requestUrl,
    required String replyUrl,
    Map<String, dynamic> payload = const {},
  }) =>
      DeeplinkRpcRequest._internal(
        requestUrl: requestUrl,
        replyUrl: replyUrl,
        payload: payload,
      );

  const factory DeeplinkRpcRequest._internal({
    required String requestUrl,
    required String replyUrl,
    required Map<String, dynamic> payload,
  }) = _DeeplinkRpcRequest;

  factory DeeplinkRpcRequest.fromJson(Map<String, dynamic> json) =>
      _$DeeplinkRpcRequestFromJson(json);

  const DeeplinkRpcRequest._();

  static const dataParameter = 'rpcQuery';
}
