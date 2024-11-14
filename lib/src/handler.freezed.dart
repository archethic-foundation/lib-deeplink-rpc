// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'handler.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeeplinkRpcRoute {
  String get pathFirstSegment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeeplinkRpcRouteCopyWith<DeeplinkRpcRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeplinkRpcRouteCopyWith<$Res> {
  factory $DeeplinkRpcRouteCopyWith(
          DeeplinkRpcRoute value, $Res Function(DeeplinkRpcRoute) then) =
      _$DeeplinkRpcRouteCopyWithImpl<$Res, DeeplinkRpcRoute>;
  @useResult
  $Res call({String pathFirstSegment});
}

/// @nodoc
class _$DeeplinkRpcRouteCopyWithImpl<$Res, $Val extends DeeplinkRpcRoute>
    implements $DeeplinkRpcRouteCopyWith<$Res> {
  _$DeeplinkRpcRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pathFirstSegment = null,
  }) {
    return _then(_value.copyWith(
      pathFirstSegment: null == pathFirstSegment
          ? _value.pathFirstSegment
          : pathFirstSegment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeplinkRpcRouteImplCopyWith<$Res>
    implements $DeeplinkRpcRouteCopyWith<$Res> {
  factory _$$DeeplinkRpcRouteImplCopyWith(_$DeeplinkRpcRouteImpl value,
          $Res Function(_$DeeplinkRpcRouteImpl) then) =
      __$$DeeplinkRpcRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pathFirstSegment});
}

/// @nodoc
class __$$DeeplinkRpcRouteImplCopyWithImpl<$Res>
    extends _$DeeplinkRpcRouteCopyWithImpl<$Res, _$DeeplinkRpcRouteImpl>
    implements _$$DeeplinkRpcRouteImplCopyWith<$Res> {
  __$$DeeplinkRpcRouteImplCopyWithImpl(_$DeeplinkRpcRouteImpl _value,
      $Res Function(_$DeeplinkRpcRouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pathFirstSegment = null,
  }) {
    return _then(_$DeeplinkRpcRouteImpl(
      null == pathFirstSegment
          ? _value.pathFirstSegment
          : pathFirstSegment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeeplinkRpcRouteImpl extends _DeeplinkRpcRoute {
  const _$DeeplinkRpcRouteImpl(this.pathFirstSegment) : super._();

  @override
  final String pathFirstSegment;

  @override
  String toString() {
    return 'DeeplinkRpcRoute(pathFirstSegment: $pathFirstSegment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeplinkRpcRouteImpl &&
            (identical(other.pathFirstSegment, pathFirstSegment) ||
                other.pathFirstSegment == pathFirstSegment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pathFirstSegment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeplinkRpcRouteImplCopyWith<_$DeeplinkRpcRouteImpl> get copyWith =>
      __$$DeeplinkRpcRouteImplCopyWithImpl<_$DeeplinkRpcRouteImpl>(
          this, _$identity);
}

abstract class _DeeplinkRpcRoute extends DeeplinkRpcRoute {
  const factory _DeeplinkRpcRoute(final String pathFirstSegment) =
      _$DeeplinkRpcRouteImpl;
  const _DeeplinkRpcRoute._() : super._();

  @override
  String get pathFirstSegment;
  @override
  @JsonKey(ignore: true)
  _$$DeeplinkRpcRouteImplCopyWith<_$DeeplinkRpcRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeeplinkRpcRequestHandler {
  DeeplinkRpcRoute get route => throw _privateConstructorUsedError;
  FutureOr<Map<String, dynamic>> Function(DeeplinkRpcRequest) get handle =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeeplinkRpcRequestHandlerCopyWith<DeeplinkRpcRequestHandler> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeplinkRpcRequestHandlerCopyWith<$Res> {
  factory $DeeplinkRpcRequestHandlerCopyWith(DeeplinkRpcRequestHandler value,
          $Res Function(DeeplinkRpcRequestHandler) then) =
      _$DeeplinkRpcRequestHandlerCopyWithImpl<$Res, DeeplinkRpcRequestHandler>;
  @useResult
  $Res call(
      {DeeplinkRpcRoute route,
      FutureOr<Map<String, dynamic>> Function(DeeplinkRpcRequest) handle});

  $DeeplinkRpcRouteCopyWith<$Res> get route;
}

/// @nodoc
class _$DeeplinkRpcRequestHandlerCopyWithImpl<$Res,
        $Val extends DeeplinkRpcRequestHandler>
    implements $DeeplinkRpcRequestHandlerCopyWith<$Res> {
  _$DeeplinkRpcRequestHandlerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? handle = null,
  }) {
    return _then(_value.copyWith(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as DeeplinkRpcRoute,
      handle: null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as FutureOr<Map<String, dynamic>> Function(DeeplinkRpcRequest),
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeeplinkRpcRouteCopyWith<$Res> get route {
    return $DeeplinkRpcRouteCopyWith<$Res>(_value.route, (value) {
      return _then(_value.copyWith(route: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeeplinkRpcRequestHandlerImplCopyWith<$Res>
    implements $DeeplinkRpcRequestHandlerCopyWith<$Res> {
  factory _$$DeeplinkRpcRequestHandlerImplCopyWith(
          _$DeeplinkRpcRequestHandlerImpl value,
          $Res Function(_$DeeplinkRpcRequestHandlerImpl) then) =
      __$$DeeplinkRpcRequestHandlerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeeplinkRpcRoute route,
      FutureOr<Map<String, dynamic>> Function(DeeplinkRpcRequest) handle});

  @override
  $DeeplinkRpcRouteCopyWith<$Res> get route;
}

/// @nodoc
class __$$DeeplinkRpcRequestHandlerImplCopyWithImpl<$Res>
    extends _$DeeplinkRpcRequestHandlerCopyWithImpl<$Res,
        _$DeeplinkRpcRequestHandlerImpl>
    implements _$$DeeplinkRpcRequestHandlerImplCopyWith<$Res> {
  __$$DeeplinkRpcRequestHandlerImplCopyWithImpl(
      _$DeeplinkRpcRequestHandlerImpl _value,
      $Res Function(_$DeeplinkRpcRequestHandlerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? handle = null,
  }) {
    return _then(_$DeeplinkRpcRequestHandlerImpl(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as DeeplinkRpcRoute,
      handle: null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as FutureOr<Map<String, dynamic>> Function(DeeplinkRpcRequest),
    ));
  }
}

/// @nodoc

class _$DeeplinkRpcRequestHandlerImpl extends _DeeplinkRpcRequestHandler {
  const _$DeeplinkRpcRequestHandlerImpl(
      {required this.route, required this.handle})
      : super._();

  @override
  final DeeplinkRpcRoute route;
  @override
  final FutureOr<Map<String, dynamic>> Function(DeeplinkRpcRequest) handle;

  @override
  String toString() {
    return 'DeeplinkRpcRequestHandler(route: $route, handle: $handle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeplinkRpcRequestHandlerImpl &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.handle, handle) || other.handle == handle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, route, handle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeplinkRpcRequestHandlerImplCopyWith<_$DeeplinkRpcRequestHandlerImpl>
      get copyWith => __$$DeeplinkRpcRequestHandlerImplCopyWithImpl<
          _$DeeplinkRpcRequestHandlerImpl>(this, _$identity);
}

abstract class _DeeplinkRpcRequestHandler extends DeeplinkRpcRequestHandler {
  const factory _DeeplinkRpcRequestHandler(
      {required final DeeplinkRpcRoute route,
      required final FutureOr<Map<String, dynamic>> Function(DeeplinkRpcRequest)
          handle}) = _$DeeplinkRpcRequestHandlerImpl;
  const _DeeplinkRpcRequestHandler._() : super._();

  @override
  DeeplinkRpcRoute get route;
  @override
  FutureOr<Map<String, dynamic>> Function(DeeplinkRpcRequest) get handle;
  @override
  @JsonKey(ignore: true)
  _$$DeeplinkRpcRequestHandlerImplCopyWith<_$DeeplinkRpcRequestHandlerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeeplinkRpcResponseHandler {
  DeeplinkRpcRoute get route => throw _privateConstructorUsedError;
  FutureOr<void> Function(DeeplinkRpcResponse) get handle =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeeplinkRpcResponseHandlerCopyWith<DeeplinkRpcResponseHandler>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeplinkRpcResponseHandlerCopyWith<$Res> {
  factory $DeeplinkRpcResponseHandlerCopyWith(DeeplinkRpcResponseHandler value,
          $Res Function(DeeplinkRpcResponseHandler) then) =
      _$DeeplinkRpcResponseHandlerCopyWithImpl<$Res,
          DeeplinkRpcResponseHandler>;
  @useResult
  $Res call(
      {DeeplinkRpcRoute route,
      FutureOr<void> Function(DeeplinkRpcResponse) handle});

  $DeeplinkRpcRouteCopyWith<$Res> get route;
}

/// @nodoc
class _$DeeplinkRpcResponseHandlerCopyWithImpl<$Res,
        $Val extends DeeplinkRpcResponseHandler>
    implements $DeeplinkRpcResponseHandlerCopyWith<$Res> {
  _$DeeplinkRpcResponseHandlerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? handle = null,
  }) {
    return _then(_value.copyWith(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as DeeplinkRpcRoute,
      handle: null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as FutureOr<void> Function(DeeplinkRpcResponse),
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeeplinkRpcRouteCopyWith<$Res> get route {
    return $DeeplinkRpcRouteCopyWith<$Res>(_value.route, (value) {
      return _then(_value.copyWith(route: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeeplinkRpcResponseHandlerImplCopyWith<$Res>
    implements $DeeplinkRpcResponseHandlerCopyWith<$Res> {
  factory _$$DeeplinkRpcResponseHandlerImplCopyWith(
          _$DeeplinkRpcResponseHandlerImpl value,
          $Res Function(_$DeeplinkRpcResponseHandlerImpl) then) =
      __$$DeeplinkRpcResponseHandlerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeeplinkRpcRoute route,
      FutureOr<void> Function(DeeplinkRpcResponse) handle});

  @override
  $DeeplinkRpcRouteCopyWith<$Res> get route;
}

/// @nodoc
class __$$DeeplinkRpcResponseHandlerImplCopyWithImpl<$Res>
    extends _$DeeplinkRpcResponseHandlerCopyWithImpl<$Res,
        _$DeeplinkRpcResponseHandlerImpl>
    implements _$$DeeplinkRpcResponseHandlerImplCopyWith<$Res> {
  __$$DeeplinkRpcResponseHandlerImplCopyWithImpl(
      _$DeeplinkRpcResponseHandlerImpl _value,
      $Res Function(_$DeeplinkRpcResponseHandlerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? handle = null,
  }) {
    return _then(_$DeeplinkRpcResponseHandlerImpl(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as DeeplinkRpcRoute,
      handle: null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as FutureOr<void> Function(DeeplinkRpcResponse),
    ));
  }
}

/// @nodoc

class _$DeeplinkRpcResponseHandlerImpl extends _DeeplinkRpcResponseHandler {
  const _$DeeplinkRpcResponseHandlerImpl(
      {required this.route, required this.handle})
      : super._();

  @override
  final DeeplinkRpcRoute route;
  @override
  final FutureOr<void> Function(DeeplinkRpcResponse) handle;

  @override
  String toString() {
    return 'DeeplinkRpcResponseHandler(route: $route, handle: $handle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeplinkRpcResponseHandlerImpl &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.handle, handle) || other.handle == handle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, route, handle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeplinkRpcResponseHandlerImplCopyWith<_$DeeplinkRpcResponseHandlerImpl>
      get copyWith => __$$DeeplinkRpcResponseHandlerImplCopyWithImpl<
          _$DeeplinkRpcResponseHandlerImpl>(this, _$identity);
}

abstract class _DeeplinkRpcResponseHandler extends DeeplinkRpcResponseHandler {
  const factory _DeeplinkRpcResponseHandler(
          {required final DeeplinkRpcRoute route,
          required final FutureOr<void> Function(DeeplinkRpcResponse) handle}) =
      _$DeeplinkRpcResponseHandlerImpl;
  const _DeeplinkRpcResponseHandler._() : super._();

  @override
  DeeplinkRpcRoute get route;
  @override
  FutureOr<void> Function(DeeplinkRpcResponse) get handle;
  @override
  @JsonKey(ignore: true)
  _$$DeeplinkRpcResponseHandlerImplCopyWith<_$DeeplinkRpcResponseHandlerImpl>
      get copyWith => throw _privateConstructorUsedError;
}
