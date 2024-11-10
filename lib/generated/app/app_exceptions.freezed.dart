// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../app/app_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppException {
  Object? get message => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? message)? generic,
    TResult Function(Object? message)? fromError,
    TResult Function(Object? message)? fileNotFound,
    TResult Function(Object? message)? nullValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenericAppException value) generic,
    required TResult Function(FromErrorAppException value) fromError,
    required TResult Function(FileNotFoundException value) fileNotFound,
    required TResult Function(NullValueException value) nullValue,
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppExceptionCopyWith<AppException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
  @useResult
  $Res call({Object? message});
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message ? _value.message : message,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenericAppExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$GenericAppExceptionImplCopyWith(_$GenericAppExceptionImpl value,
          $Res Function(_$GenericAppExceptionImpl) then) =
      __$$GenericAppExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? message});
}

/// @nodoc
class __$$GenericAppExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$GenericAppExceptionImpl>
    implements _$$GenericAppExceptionImplCopyWith<$Res> {
  __$$GenericAppExceptionImplCopyWithImpl(_$GenericAppExceptionImpl _value,
      $Res Function(_$GenericAppExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$GenericAppExceptionImpl(
      freezed == message ? _value.message : message,
    ));
  }
}

/// @nodoc

class _$GenericAppExceptionImpl extends GenericAppException {
  const _$GenericAppExceptionImpl([this.message]) : super._();

  @override
  final Object? message;

  @override
  String toString() {
    return 'AppException.generic(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericAppExceptionImpl &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericAppExceptionImplCopyWith<_$GenericAppExceptionImpl> get copyWith =>
      __$$GenericAppExceptionImplCopyWithImpl<_$GenericAppExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? message)? generic,
    TResult Function(Object? message)? fromError,
    TResult Function(Object? message)? fileNotFound,
    TResult Function(Object? message)? nullValue,
    required TResult orElse(),
  }) {
    if (generic != null) {
      return generic(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenericAppException value) generic,
    required TResult Function(FromErrorAppException value) fromError,
    required TResult Function(FileNotFoundException value) fileNotFound,
    required TResult Function(NullValueException value) nullValue,
  }) {
    return generic(this);
  }
}

abstract class GenericAppException extends AppException {
  const factory GenericAppException([final Object? message]) =
      _$GenericAppExceptionImpl;
  const GenericAppException._() : super._();

  @override
  Object? get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenericAppExceptionImplCopyWith<_$GenericAppExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FromErrorAppExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$FromErrorAppExceptionImplCopyWith(
          _$FromErrorAppExceptionImpl value,
          $Res Function(_$FromErrorAppExceptionImpl) then) =
      __$$FromErrorAppExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? message});
}

/// @nodoc
class __$$FromErrorAppExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$FromErrorAppExceptionImpl>
    implements _$$FromErrorAppExceptionImplCopyWith<$Res> {
  __$$FromErrorAppExceptionImplCopyWithImpl(_$FromErrorAppExceptionImpl _value,
      $Res Function(_$FromErrorAppExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$FromErrorAppExceptionImpl(
      freezed == message ? _value.message : message,
    ));
  }
}

/// @nodoc

class _$FromErrorAppExceptionImpl extends FromErrorAppException {
  const _$FromErrorAppExceptionImpl([this.message]) : super._();

  @override
  final Object? message;

  @override
  String toString() {
    return 'AppException.fromError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FromErrorAppExceptionImpl &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FromErrorAppExceptionImplCopyWith<_$FromErrorAppExceptionImpl>
      get copyWith => __$$FromErrorAppExceptionImplCopyWithImpl<
          _$FromErrorAppExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? message)? generic,
    TResult Function(Object? message)? fromError,
    TResult Function(Object? message)? fileNotFound,
    TResult Function(Object? message)? nullValue,
    required TResult orElse(),
  }) {
    if (fromError != null) {
      return fromError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenericAppException value) generic,
    required TResult Function(FromErrorAppException value) fromError,
    required TResult Function(FileNotFoundException value) fileNotFound,
    required TResult Function(NullValueException value) nullValue,
  }) {
    return fromError(this);
  }
}

abstract class FromErrorAppException extends AppException {
  const factory FromErrorAppException([final Object? message]) =
      _$FromErrorAppExceptionImpl;
  const FromErrorAppException._() : super._();

  @override
  Object? get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FromErrorAppExceptionImplCopyWith<_$FromErrorAppExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FileNotFoundExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$FileNotFoundExceptionImplCopyWith(
          _$FileNotFoundExceptionImpl value,
          $Res Function(_$FileNotFoundExceptionImpl) then) =
      __$$FileNotFoundExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? message});
}

/// @nodoc
class __$$FileNotFoundExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$FileNotFoundExceptionImpl>
    implements _$$FileNotFoundExceptionImplCopyWith<$Res> {
  __$$FileNotFoundExceptionImplCopyWithImpl(_$FileNotFoundExceptionImpl _value,
      $Res Function(_$FileNotFoundExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$FileNotFoundExceptionImpl(
      freezed == message ? _value.message : message,
    ));
  }
}

/// @nodoc

class _$FileNotFoundExceptionImpl extends FileNotFoundException {
  const _$FileNotFoundExceptionImpl([this.message]) : super._();

  @override
  final Object? message;

  @override
  String toString() {
    return 'AppException.fileNotFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileNotFoundExceptionImpl &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileNotFoundExceptionImplCopyWith<_$FileNotFoundExceptionImpl>
      get copyWith => __$$FileNotFoundExceptionImplCopyWithImpl<
          _$FileNotFoundExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? message)? generic,
    TResult Function(Object? message)? fromError,
    TResult Function(Object? message)? fileNotFound,
    TResult Function(Object? message)? nullValue,
    required TResult orElse(),
  }) {
    if (fileNotFound != null) {
      return fileNotFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenericAppException value) generic,
    required TResult Function(FromErrorAppException value) fromError,
    required TResult Function(FileNotFoundException value) fileNotFound,
    required TResult Function(NullValueException value) nullValue,
  }) {
    return fileNotFound(this);
  }
}

abstract class FileNotFoundException extends AppException {
  const factory FileNotFoundException([final Object? message]) =
      _$FileNotFoundExceptionImpl;
  const FileNotFoundException._() : super._();

  @override
  Object? get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileNotFoundExceptionImplCopyWith<_$FileNotFoundExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NullValueExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$NullValueExceptionImplCopyWith(_$NullValueExceptionImpl value,
          $Res Function(_$NullValueExceptionImpl) then) =
      __$$NullValueExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? message});
}

/// @nodoc
class __$$NullValueExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NullValueExceptionImpl>
    implements _$$NullValueExceptionImplCopyWith<$Res> {
  __$$NullValueExceptionImplCopyWithImpl(_$NullValueExceptionImpl _value,
      $Res Function(_$NullValueExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NullValueExceptionImpl(
      freezed == message ? _value.message : message,
    ));
  }
}

/// @nodoc

class _$NullValueExceptionImpl extends NullValueException {
  const _$NullValueExceptionImpl([this.message]) : super._();

  @override
  final Object? message;

  @override
  String toString() {
    return 'AppException.nullValue(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NullValueExceptionImpl &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NullValueExceptionImplCopyWith<_$NullValueExceptionImpl> get copyWith =>
      __$$NullValueExceptionImplCopyWithImpl<_$NullValueExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? message)? generic,
    TResult Function(Object? message)? fromError,
    TResult Function(Object? message)? fileNotFound,
    TResult Function(Object? message)? nullValue,
    required TResult orElse(),
  }) {
    if (nullValue != null) {
      return nullValue(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenericAppException value) generic,
    required TResult Function(FromErrorAppException value) fromError,
    required TResult Function(FileNotFoundException value) fileNotFound,
    required TResult Function(NullValueException value) nullValue,
  }) {
    return nullValue(this);
  }
}

abstract class NullValueException extends AppException {
  const factory NullValueException([final Object? message]) =
      _$NullValueExceptionImpl;
  const NullValueException._() : super._();

  @override
  Object? get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NullValueExceptionImplCopyWith<_$NullValueExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
