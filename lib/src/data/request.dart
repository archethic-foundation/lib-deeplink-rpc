import 'package:deeplink_rpc/src/codec.dart';
import 'package:deeplink_rpc/src/data/failure.dart';
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
        id: const Uuid().v4(),
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

  factory DeeplinkRpcRequest.decode(Object? argument) {
    if (argument is! String) {
      throw const DeeplinkRpcFailure(code: DeeplinkRpcFailure.kInvalidRequest);
    }

    return DeeplinkRpcRequest.fromJson(
      deeplinkRpc.decode(argument),
    );
  }

  String encode() => deeplinkRpc.encode(toJson());
}
