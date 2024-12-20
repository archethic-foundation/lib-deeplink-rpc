/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:deeplink_rpc/src/data/failure.dart';
import 'package:deeplink_rpc/src/data/result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

/// RPC request result to send back through Deeplink.
@JsonSerializable(includeIfNull: false)
class DeeplinkRpcResponse {
  const DeeplinkRpcResponse({
    required this.id,
    this.failure,
    this.result,
  }) : assert(
          failure == null || result == null,
          'A response cannot be both success and failure.',
        );

  factory DeeplinkRpcResponse.fromJson(Map<String, dynamic> json) =>
      _$DeeplinkRpcResponseFromJson(json);

  factory DeeplinkRpcResponse.success({
    required String id,
    dynamic result,
  }) =>
      DeeplinkRpcResponse(
        id: id,
        result: result,
      );

  factory DeeplinkRpcResponse.failure({
    required String id,
    required DeeplinkRpcFailure failure,
  }) =>
      DeeplinkRpcResponse(
        id: id,
        failure: failure,
      );

  final String id;
  final DeeplinkRpcFailure? failure;
  final dynamic result;

  T map<T>({
    required T Function(DeeplinkRpcFailure failure) failure,
    required T Function(dynamic result) success,
  }) {
    if (this.failure != null) return failure(this.failure!);
    return success(result);
  }

  Map<String, dynamic> toJson() => _$DeeplinkRpcResponseToJson(this);
}

extension DeeplinkRpcResultExt on DeeplinkRpcResult {
  DeeplinkRpcResponse? toResponse() => map(
        failure: (failure) {
          final request = failure.request;
          if (request == null) return null;
          return DeeplinkRpcResponse.failure(
            id: request.id,
            failure: failure.failure,
          );
        },
        success: (success) => DeeplinkRpcResponse.success(
          id: success.request.id,
          result: success.result,
        ),
      );
}
