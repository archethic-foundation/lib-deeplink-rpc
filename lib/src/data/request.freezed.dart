// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeeplinkRpcRequest _$DeeplinkRpcRequestFromJson(Map<String, dynamic> json) {
  return _DeeplinkRpcRequest.fromJson(json);
}

/// @nodoc
mixin _$DeeplinkRpcRequest {
  String get id => throw _privateConstructorUsedError;
  String get requestUrl => throw _privateConstructorUsedError;
  String get replyUrl => throw _privateConstructorUsedError;
  Map<String, dynamic> get params => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeeplinkRpcRequestCopyWith<DeeplinkRpcRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeplinkRpcRequestCopyWith<$Res> {
  factory $DeeplinkRpcRequestCopyWith(
          DeeplinkRpcRequest value, $Res Function(DeeplinkRpcRequest) then) =
      _$DeeplinkRpcRequestCopyWithImpl<$Res, DeeplinkRpcRequest>;
  @useResult
  $Res call(
      {String id,
      String requestUrl,
      String replyUrl,
      Map<String, dynamic> params});
}

/// @nodoc
class _$DeeplinkRpcRequestCopyWithImpl<$Res, $Val extends DeeplinkRpcRequest>
    implements $DeeplinkRpcRequestCopyWith<$Res> {
  _$DeeplinkRpcRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requestUrl = null,
    Object? replyUrl = null,
    Object? params = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      requestUrl: null == requestUrl
          ? _value.requestUrl
          : requestUrl // ignore: cast_nullable_to_non_nullable
              as String,
      replyUrl: null == replyUrl
          ? _value.replyUrl
          : replyUrl // ignore: cast_nullable_to_non_nullable
              as String,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeeplinkRpcRequestCopyWith<$Res>
    implements $DeeplinkRpcRequestCopyWith<$Res> {
  factory _$$_DeeplinkRpcRequestCopyWith(_$_DeeplinkRpcRequest value,
          $Res Function(_$_DeeplinkRpcRequest) then) =
      __$$_DeeplinkRpcRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String requestUrl,
      String replyUrl,
      Map<String, dynamic> params});
}

/// @nodoc
class __$$_DeeplinkRpcRequestCopyWithImpl<$Res>
    extends _$DeeplinkRpcRequestCopyWithImpl<$Res, _$_DeeplinkRpcRequest>
    implements _$$_DeeplinkRpcRequestCopyWith<$Res> {
  __$$_DeeplinkRpcRequestCopyWithImpl(
      _$_DeeplinkRpcRequest _value, $Res Function(_$_DeeplinkRpcRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requestUrl = null,
    Object? replyUrl = null,
    Object? params = null,
  }) {
    return _then(_$_DeeplinkRpcRequest(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      requestUrl: null == requestUrl
          ? _value.requestUrl
          : requestUrl // ignore: cast_nullable_to_non_nullable
              as String,
      replyUrl: null == replyUrl
          ? _value.replyUrl
          : replyUrl // ignore: cast_nullable_to_non_nullable
              as String,
      params: null == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeeplinkRpcRequest extends _DeeplinkRpcRequest {
  const _$_DeeplinkRpcRequest(
      {required this.id,
      required this.requestUrl,
      required this.replyUrl,
      required final Map<String, dynamic> params})
      : _params = params,
        super._();

  factory _$_DeeplinkRpcRequest.fromJson(Map<String, dynamic> json) =>
      _$$_DeeplinkRpcRequestFromJson(json);

  @override
  final String id;
  @override
  final String requestUrl;
  @override
  final String replyUrl;
  final Map<String, dynamic> _params;
  @override
  Map<String, dynamic> get params {
    if (_params is EqualUnmodifiableMapView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_params);
  }

  @override
  String toString() {
    return 'DeeplinkRpcRequest._internal(id: $id, requestUrl: $requestUrl, replyUrl: $replyUrl, params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeeplinkRpcRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.requestUrl, requestUrl) ||
                other.requestUrl == requestUrl) &&
            (identical(other.replyUrl, replyUrl) ||
                other.replyUrl == replyUrl) &&
            const DeepCollectionEquality().equals(other._params, _params));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, requestUrl, replyUrl,
      const DeepCollectionEquality().hash(_params));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeeplinkRpcRequestCopyWith<_$_DeeplinkRpcRequest> get copyWith =>
      __$$_DeeplinkRpcRequestCopyWithImpl<_$_DeeplinkRpcRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeeplinkRpcRequestToJson(
      this,
    );
  }
}

abstract class _DeeplinkRpcRequest extends DeeplinkRpcRequest {
  const factory _DeeplinkRpcRequest(
      {required final String id,
      required final String requestUrl,
      required final String replyUrl,
      required final Map<String, dynamic> params}) = _$_DeeplinkRpcRequest;
  const _DeeplinkRpcRequest._() : super._();

  factory _DeeplinkRpcRequest.fromJson(Map<String, dynamic> json) =
      _$_DeeplinkRpcRequest.fromJson;

  @override
  String get id;
  @override
  String get requestUrl;
  @override
  String get replyUrl;
  @override
  Map<String, dynamic> get params;
  @override
  @JsonKey(ignore: true)
  _$$_DeeplinkRpcRequestCopyWith<_$_DeeplinkRpcRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
