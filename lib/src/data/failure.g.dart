// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeeplinkRpcFailureImpl _$$DeeplinkRpcFailureImplFromJson(
        Map<String, dynamic> json) =>
    _$DeeplinkRpcFailureImpl(
      code: json['code'] as int,
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$$DeeplinkRpcFailureImplToJson(
        _$DeeplinkRpcFailureImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
