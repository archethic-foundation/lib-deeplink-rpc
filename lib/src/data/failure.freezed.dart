// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeeplinkRpcFailure _$DeeplinkRpcFailureFromJson(Map<String, dynamic> json) {
  return _DeeplinkRpcFailure.fromJson(json);
}

/// @nodoc
mixin _$DeeplinkRpcFailure {
  int get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeeplinkRpcFailureCopyWith<DeeplinkRpcFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeplinkRpcFailureCopyWith<$Res> {
  factory $DeeplinkRpcFailureCopyWith(
          DeeplinkRpcFailure value, $Res Function(DeeplinkRpcFailure) then) =
      _$DeeplinkRpcFailureCopyWithImpl<$Res, DeeplinkRpcFailure>;
  @useResult
  $Res call({int code, String? message, dynamic data});
}

/// @nodoc
class _$DeeplinkRpcFailureCopyWithImpl<$Res, $Val extends DeeplinkRpcFailure>
    implements $DeeplinkRpcFailureCopyWith<$Res> {
  _$DeeplinkRpcFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeplinkRpcFailureImplCopyWith<$Res>
    implements $DeeplinkRpcFailureCopyWith<$Res> {
  factory _$$DeeplinkRpcFailureImplCopyWith(_$DeeplinkRpcFailureImpl value,
          $Res Function(_$DeeplinkRpcFailureImpl) then) =
      __$$DeeplinkRpcFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String? message, dynamic data});
}

/// @nodoc
class __$$DeeplinkRpcFailureImplCopyWithImpl<$Res>
    extends _$DeeplinkRpcFailureCopyWithImpl<$Res, _$DeeplinkRpcFailureImpl>
    implements _$$DeeplinkRpcFailureImplCopyWith<$Res> {
  __$$DeeplinkRpcFailureImplCopyWithImpl(_$DeeplinkRpcFailureImpl _value,
      $Res Function(_$DeeplinkRpcFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$DeeplinkRpcFailureImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeplinkRpcFailureImpl extends _DeeplinkRpcFailure {
  const _$DeeplinkRpcFailureImpl({required this.code, this.message, this.data})
      : super._();

  factory _$DeeplinkRpcFailureImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeplinkRpcFailureImplFromJson(json);

  @override
  final int code;
  @override
  final String? message;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'DeeplinkRpcFailure(code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeplinkRpcFailureImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, message, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeplinkRpcFailureImplCopyWith<_$DeeplinkRpcFailureImpl> get copyWith =>
      __$$DeeplinkRpcFailureImplCopyWithImpl<_$DeeplinkRpcFailureImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeplinkRpcFailureImplToJson(
      this,
    );
  }
}

abstract class _DeeplinkRpcFailure extends DeeplinkRpcFailure {
  const factory _DeeplinkRpcFailure(
      {required final int code,
      final String? message,
      final dynamic data}) = _$DeeplinkRpcFailureImpl;
  const _DeeplinkRpcFailure._() : super._();

  factory _DeeplinkRpcFailure.fromJson(Map<String, dynamic> json) =
      _$DeeplinkRpcFailureImpl.fromJson;

  @override
  int get code;
  @override
  String? get message;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$DeeplinkRpcFailureImplCopyWith<_$DeeplinkRpcFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
