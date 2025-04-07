// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeeplinkRpcResponse _$DeeplinkRpcResponseFromJson(Map<String, dynamic> json) =>
    DeeplinkRpcResponse(
      id: json['id'] as String,
      failure: json['failure'] == null
          ? null
          : DeeplinkRpcFailure.fromJson(
              json['failure'] as Map<String, dynamic>),
      result: json['result'],
    );

Map<String, dynamic> _$DeeplinkRpcResponseToJson(
        DeeplinkRpcResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.failure case final value?) 'failure': value,
      if (instance.result case final value?) 'result': value,
    };
