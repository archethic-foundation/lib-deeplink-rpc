// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeeplinkRpcRequest _$$_DeeplinkRpcRequestFromJson(
        Map<String, dynamic> json) =>
    _$_DeeplinkRpcRequest(
      id: json['id'] as String,
      requestUrl: json['requestUrl'] as String,
      replyUrl: json['replyUrl'] as String,
      params: json['params'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_DeeplinkRpcRequestToJson(
        _$_DeeplinkRpcRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requestUrl': instance.requestUrl,
      'replyUrl': instance.replyUrl,
      'params': instance.params,
    };
