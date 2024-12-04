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

/// @nodoc
mixin _$DeeplinkRpcFailure {
  DeeplinkRpcRequest get request => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Create a copy of DeeplinkRpcFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeplinkRpcFailureCopyWith<DeeplinkRpcFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeplinkRpcFailureCopyWith<$Res> {
  factory $DeeplinkRpcFailureCopyWith(
          DeeplinkRpcFailure value, $Res Function(DeeplinkRpcFailure) then) =
      _$DeeplinkRpcFailureCopyWithImpl<$Res, DeeplinkRpcFailure>;
  @useResult
  $Res call({DeeplinkRpcRequest request, int code, String? message});

  $DeeplinkRpcRequestCopyWith<$Res> get request;
}

/// @nodoc
class _$DeeplinkRpcFailureCopyWithImpl<$Res, $Val extends DeeplinkRpcFailure>
    implements $DeeplinkRpcFailureCopyWith<$Res> {
  _$DeeplinkRpcFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeplinkRpcFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
    Object? code = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as DeeplinkRpcRequest,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of DeeplinkRpcFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeeplinkRpcRequestCopyWith<$Res> get request {
    return $DeeplinkRpcRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
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
  $Res call({DeeplinkRpcRequest request, int code, String? message});

  @override
  $DeeplinkRpcRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$DeeplinkRpcFailureImplCopyWithImpl<$Res>
    extends _$DeeplinkRpcFailureCopyWithImpl<$Res, _$DeeplinkRpcFailureImpl>
    implements _$$DeeplinkRpcFailureImplCopyWith<$Res> {
  __$$DeeplinkRpcFailureImplCopyWithImpl(_$DeeplinkRpcFailureImpl _value,
      $Res Function(_$DeeplinkRpcFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeplinkRpcFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
    Object? code = null,
    Object? message = freezed,
  }) {
    return _then(_$DeeplinkRpcFailureImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as DeeplinkRpcRequest,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DeeplinkRpcFailureImpl extends _DeeplinkRpcFailure {
  const _$DeeplinkRpcFailureImpl(
      {required this.request, required this.code, this.message})
      : super._();

  @override
  final DeeplinkRpcRequest request;
  @override
  final int code;
  @override
  final String? message;

  @override
  String toString() {
    return 'DeeplinkRpcFailure(request: $request, code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeplinkRpcFailureImpl &&
            (identical(other.request, request) || other.request == request) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request, code, message);

  /// Create a copy of DeeplinkRpcFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeplinkRpcFailureImplCopyWith<_$DeeplinkRpcFailureImpl> get copyWith =>
      __$$DeeplinkRpcFailureImplCopyWithImpl<_$DeeplinkRpcFailureImpl>(
          this, _$identity);
}

abstract class _DeeplinkRpcFailure extends DeeplinkRpcFailure {
  const factory _DeeplinkRpcFailure(
      {required final DeeplinkRpcRequest request,
      required final int code,
      final String? message}) = _$DeeplinkRpcFailureImpl;
  const _DeeplinkRpcFailure._() : super._();

  @override
  DeeplinkRpcRequest get request;
  @override
  int get code;
  @override
  String? get message;

  /// Create a copy of DeeplinkRpcFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeplinkRpcFailureImplCopyWith<_$DeeplinkRpcFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
