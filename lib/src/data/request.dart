/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'request.freezed.dart';
part 'request.g.dart';

/// RPC request received through Deeplink.
@freezed
class DeeplinkRpcRequest with _$DeeplinkRpcRequest {
  factory DeeplinkRpcRequest({
    required String requestUrl,
    required String replyUrl,
    Map<String, dynamic> params = const {},
  }) =>
      DeeplinkRpcRequest._internal(
        id: const Uuid().v4(), // TODOrename to `nonce`
        requestUrl: requestUrl,
        replyUrl: replyUrl,
        params: params,
      );

  const factory DeeplinkRpcRequest._internal({
    required String id,
    required String requestUrl,
    required String replyUrl,
    required Map<String, dynamic> params,
  }) = _DeeplinkRpcRequest;

  factory DeeplinkRpcRequest.fromJson(Map<String, dynamic> json) =>
      _$DeeplinkRpcRequestFromJson(json);

  const DeeplinkRpcRequest._();
}
