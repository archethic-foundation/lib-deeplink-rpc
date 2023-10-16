// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeeplinkRpcRequestImpl _$$DeeplinkRpcRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$DeeplinkRpcRequestImpl(
      id: json['id'] as String,
      requestUrl: json['requestUrl'] as String,
      replyUrl: json['replyUrl'] as String,
      params: json['params'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$DeeplinkRpcRequestImplToJson(
        _$DeeplinkRpcRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requestUrl': instance.requestUrl,
      'replyUrl': instance.replyUrl,
      'params': instance.params,
    };
