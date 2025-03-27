// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeeplinkRpcRequestImpl _$$DeeplinkRpcRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$DeeplinkRpcRequestImpl(
      requestUrl: json['requestUrl'] as String,
      replyUrl: json['replyUrl'] as String,
      payload: json['payload'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$DeeplinkRpcRequestImplToJson(
        _$DeeplinkRpcRequestImpl instance) =>
    <String, dynamic>{
      'requestUrl': instance.requestUrl,
      'replyUrl': instance.replyUrl,
      'payload': instance.payload,
    };
