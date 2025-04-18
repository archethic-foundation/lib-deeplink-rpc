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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeeplinkRpcRequest _$DeeplinkRpcRequestFromJson(Map<String, dynamic> json) {
  return _DeeplinkRpcRequest.fromJson(json);
}

/// @nodoc
mixin _$DeeplinkRpcRequest {
  String get id => throw _privateConstructorUsedError;
  String get requestUrl => throw _privateConstructorUsedError;
  String get replyUrl => throw _privateConstructorUsedError;
  Map<String, dynamic> get params => throw _privateConstructorUsedError;

  /// Serializes this DeeplinkRpcRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeplinkRpcRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of DeeplinkRpcRequest
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$DeeplinkRpcRequestImplCopyWith<$Res>
    implements $DeeplinkRpcRequestCopyWith<$Res> {
  factory _$$DeeplinkRpcRequestImplCopyWith(_$DeeplinkRpcRequestImpl value,
          $Res Function(_$DeeplinkRpcRequestImpl) then) =
      __$$DeeplinkRpcRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String requestUrl,
      String replyUrl,
      Map<String, dynamic> params});
}

/// @nodoc
class __$$DeeplinkRpcRequestImplCopyWithImpl<$Res>
    extends _$DeeplinkRpcRequestCopyWithImpl<$Res, _$DeeplinkRpcRequestImpl>
    implements _$$DeeplinkRpcRequestImplCopyWith<$Res> {
  __$$DeeplinkRpcRequestImplCopyWithImpl(_$DeeplinkRpcRequestImpl _value,
      $Res Function(_$DeeplinkRpcRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeplinkRpcRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requestUrl = null,
    Object? replyUrl = null,
    Object? params = null,
  }) {
    return _then(_$DeeplinkRpcRequestImpl(
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
class _$DeeplinkRpcRequestImpl extends _DeeplinkRpcRequest {
  const _$DeeplinkRpcRequestImpl(
      {required this.id,
      required this.requestUrl,
      required this.replyUrl,
      required final Map<String, dynamic> params})
      : _params = params,
        super._();

  factory _$DeeplinkRpcRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeplinkRpcRequestImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeplinkRpcRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.requestUrl, requestUrl) ||
                other.requestUrl == requestUrl) &&
            (identical(other.replyUrl, replyUrl) ||
                other.replyUrl == replyUrl) &&
            const DeepCollectionEquality().equals(other._params, _params));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, requestUrl, replyUrl,
      const DeepCollectionEquality().hash(_params));

  /// Create a copy of DeeplinkRpcRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeplinkRpcRequestImplCopyWith<_$DeeplinkRpcRequestImpl> get copyWith =>
      __$$DeeplinkRpcRequestImplCopyWithImpl<_$DeeplinkRpcRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeplinkRpcRequestImplToJson(
      this,
    );
  }
}

abstract class _DeeplinkRpcRequest extends DeeplinkRpcRequest {
  const factory _DeeplinkRpcRequest(
      {required final String id,
      required final String requestUrl,
      required final String replyUrl,
      required final Map<String, dynamic> params}) = _$DeeplinkRpcRequestImpl;
  const _DeeplinkRpcRequest._() : super._();

  factory _DeeplinkRpcRequest.fromJson(Map<String, dynamic> json) =
      _$DeeplinkRpcRequestImpl.fromJson;

  @override
  String get id;
  @override
  String get requestUrl;
  @override
  String get replyUrl;
  @override
  Map<String, dynamic> get params;

  /// Create a copy of DeeplinkRpcRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeplinkRpcRequestImplCopyWith<_$DeeplinkRpcRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
