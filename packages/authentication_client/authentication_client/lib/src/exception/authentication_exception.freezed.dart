// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthenticationException {
  Object? get error => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? signInCancelledException,
    TResult Function(Object? error)? googleSignInException,
    TResult Function(Object? error)? signOutException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInCancelledException value)
        signInCancelledException,
    required TResult Function(GoogleSignInException value)
        googleSignInException,
    required TResult Function(SignOutException value) signOutException,
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AuthenticationException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthenticationExceptionCopyWith<AuthenticationException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationExceptionCopyWith<$Res> {
  factory $AuthenticationExceptionCopyWith(AuthenticationException value,
          $Res Function(AuthenticationException) then) =
      _$AuthenticationExceptionCopyWithImpl<$Res, AuthenticationException>;
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class _$AuthenticationExceptionCopyWithImpl<$Res,
        $Val extends AuthenticationException>
    implements $AuthenticationExceptionCopyWith<$Res> {
  _$AuthenticationExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInCancelledExceptionImplCopyWith<$Res>
    implements $AuthenticationExceptionCopyWith<$Res> {
  factory _$$SignInCancelledExceptionImplCopyWith(
          _$SignInCancelledExceptionImpl value,
          $Res Function(_$SignInCancelledExceptionImpl) then) =
      __$$SignInCancelledExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$SignInCancelledExceptionImplCopyWithImpl<$Res>
    extends _$AuthenticationExceptionCopyWithImpl<$Res,
        _$SignInCancelledExceptionImpl>
    implements _$$SignInCancelledExceptionImplCopyWith<$Res> {
  __$$SignInCancelledExceptionImplCopyWithImpl(
      _$SignInCancelledExceptionImpl _value,
      $Res Function(_$SignInCancelledExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$SignInCancelledExceptionImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$SignInCancelledExceptionImpl extends SignInCancelledException {
  const _$SignInCancelledExceptionImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationException.signInCancelledException(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInCancelledExceptionImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of AuthenticationException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInCancelledExceptionImplCopyWith<_$SignInCancelledExceptionImpl>
      get copyWith => __$$SignInCancelledExceptionImplCopyWithImpl<
          _$SignInCancelledExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? signInCancelledException,
    TResult Function(Object? error)? googleSignInException,
    TResult Function(Object? error)? signOutException,
    required TResult orElse(),
  }) {
    if (signInCancelledException != null) {
      return signInCancelledException(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInCancelledException value)
        signInCancelledException,
    required TResult Function(GoogleSignInException value)
        googleSignInException,
    required TResult Function(SignOutException value) signOutException,
  }) {
    return signInCancelledException(this);
  }
}

abstract class SignInCancelledException extends AuthenticationException {
  const factory SignInCancelledException(final Object? error) =
      _$SignInCancelledExceptionImpl;
  const SignInCancelledException._() : super._();

  @override
  Object? get error;

  /// Create a copy of AuthenticationException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInCancelledExceptionImplCopyWith<_$SignInCancelledExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoogleSignInExceptionImplCopyWith<$Res>
    implements $AuthenticationExceptionCopyWith<$Res> {
  factory _$$GoogleSignInExceptionImplCopyWith(
          _$GoogleSignInExceptionImpl value,
          $Res Function(_$GoogleSignInExceptionImpl) then) =
      __$$GoogleSignInExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$GoogleSignInExceptionImplCopyWithImpl<$Res>
    extends _$AuthenticationExceptionCopyWithImpl<$Res,
        _$GoogleSignInExceptionImpl>
    implements _$$GoogleSignInExceptionImplCopyWith<$Res> {
  __$$GoogleSignInExceptionImplCopyWithImpl(_$GoogleSignInExceptionImpl _value,
      $Res Function(_$GoogleSignInExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$GoogleSignInExceptionImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$GoogleSignInExceptionImpl extends GoogleSignInException {
  const _$GoogleSignInExceptionImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationException.googleSignInException(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleSignInExceptionImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of AuthenticationException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleSignInExceptionImplCopyWith<_$GoogleSignInExceptionImpl>
      get copyWith => __$$GoogleSignInExceptionImplCopyWithImpl<
          _$GoogleSignInExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? signInCancelledException,
    TResult Function(Object? error)? googleSignInException,
    TResult Function(Object? error)? signOutException,
    required TResult orElse(),
  }) {
    if (googleSignInException != null) {
      return googleSignInException(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInCancelledException value)
        signInCancelledException,
    required TResult Function(GoogleSignInException value)
        googleSignInException,
    required TResult Function(SignOutException value) signOutException,
  }) {
    return googleSignInException(this);
  }
}

abstract class GoogleSignInException extends AuthenticationException {
  const factory GoogleSignInException(final Object? error) =
      _$GoogleSignInExceptionImpl;
  const GoogleSignInException._() : super._();

  @override
  Object? get error;

  /// Create a copy of AuthenticationException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoogleSignInExceptionImplCopyWith<_$GoogleSignInExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignOutExceptionImplCopyWith<$Res>
    implements $AuthenticationExceptionCopyWith<$Res> {
  factory _$$SignOutExceptionImplCopyWith(_$SignOutExceptionImpl value,
          $Res Function(_$SignOutExceptionImpl) then) =
      __$$SignOutExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$SignOutExceptionImplCopyWithImpl<$Res>
    extends _$AuthenticationExceptionCopyWithImpl<$Res, _$SignOutExceptionImpl>
    implements _$$SignOutExceptionImplCopyWith<$Res> {
  __$$SignOutExceptionImplCopyWithImpl(_$SignOutExceptionImpl _value,
      $Res Function(_$SignOutExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$SignOutExceptionImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$SignOutExceptionImpl extends SignOutException {
  const _$SignOutExceptionImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationException.signOutException(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignOutExceptionImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of AuthenticationException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignOutExceptionImplCopyWith<_$SignOutExceptionImpl> get copyWith =>
      __$$SignOutExceptionImplCopyWithImpl<_$SignOutExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? signInCancelledException,
    TResult Function(Object? error)? googleSignInException,
    TResult Function(Object? error)? signOutException,
    required TResult orElse(),
  }) {
    if (signOutException != null) {
      return signOutException(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInCancelledException value)
        signInCancelledException,
    required TResult Function(GoogleSignInException value)
        googleSignInException,
    required TResult Function(SignOutException value) signOutException,
  }) {
    return signOutException(this);
  }
}

abstract class SignOutException extends AuthenticationException {
  const factory SignOutException(final Object? error) = _$SignOutExceptionImpl;
  const SignOutException._() : super._();

  @override
  Object? get error;

  /// Create a copy of AuthenticationException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignOutExceptionImplCopyWith<_$SignOutExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
