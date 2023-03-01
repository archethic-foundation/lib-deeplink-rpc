/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:deeplink_rpc/deeplink_rpc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class DeeplinkRpcResult with _$DeeplinkRpcResult {
  const DeeplinkRpcResult._();
  const factory DeeplinkRpcResult.failure({
    DeeplinkRpcRequest? request,
    required DeeplinkRpcFailure failure,
  }) = _DeeplinkRpcResultFailure;

  const factory DeeplinkRpcResult.success({
    required DeeplinkRpcRequest request,
    dynamic result,
  }) = _DeeplinkRpcResultSuccess;
}
