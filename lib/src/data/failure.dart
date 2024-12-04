/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:deeplink_rpc/deeplink_rpc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class DeeplinkRpcFailure with _$DeeplinkRpcFailure implements Exception {
  const factory DeeplinkRpcFailure({
    required DeeplinkRpcRequest request,
    required int code,
    String? message,
  }) = _DeeplinkRpcFailure;

  const DeeplinkRpcFailure._();

  static const kConnectivityIssue = 4901;
  static const kTimeout = -33000;
}
