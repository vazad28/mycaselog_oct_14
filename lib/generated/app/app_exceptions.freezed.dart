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
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? generic,
    TResult Function(Object error)? fromError,
    TResult Function()? fileNotFound,
    TResult Function()? nullValue,
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
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
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
}

/// @nodoc
abstract class _$$GenericAppExceptionImplCopyWith<$Res> {
  factory _$$GenericAppExceptionImplCopyWith(_$GenericAppExceptionImpl value,
          $Res Function(_$GenericAppExceptionImpl) then) =
      __$$GenericAppExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
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
    Object? error = null,
  }) {
    return _then(_$GenericAppExceptionImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GenericAppExceptionImpl extends GenericAppException {
  const _$GenericAppExceptionImpl(this.error) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'AppException.generic(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericAppExceptionImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

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
    TResult Function(String error)? generic,
    TResult Function(Object error)? fromError,
    TResult Function()? fileNotFound,
    TResult Function()? nullValue,
    required TResult orElse(),
  }) {
    if (generic != null) {
      return generic(error);
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
  const factory GenericAppException(final String error) =
      _$GenericAppExceptionImpl;
  const GenericAppException._() : super._();

  String get error;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenericAppExceptionImplCopyWith<_$GenericAppExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FromErrorAppExceptionImplCopyWith<$Res> {
  factory _$$FromErrorAppExceptionImplCopyWith(
          _$FromErrorAppExceptionImpl value,
          $Res Function(_$FromErrorAppExceptionImpl) then) =
      __$$FromErrorAppExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
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
    Object? error = null,
  }) {
    return _then(_$FromErrorAppExceptionImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$FromErrorAppExceptionImpl extends FromErrorAppException {
  const _$FromErrorAppExceptionImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'AppException.fromError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FromErrorAppExceptionImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

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
    TResult Function(String error)? generic,
    TResult Function(Object error)? fromError,
    TResult Function()? fileNotFound,
    TResult Function()? nullValue,
    required TResult orElse(),
  }) {
    if (fromError != null) {
      return fromError(error);
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
  const factory FromErrorAppException(final Object error) =
      _$FromErrorAppExceptionImpl;
  const FromErrorAppException._() : super._();

  Object get error;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FromErrorAppExceptionImplCopyWith<_$FromErrorAppExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FileNotFoundExceptionImplCopyWith<$Res> {
  factory _$$FileNotFoundExceptionImplCopyWith(
          _$FileNotFoundExceptionImpl value,
          $Res Function(_$FileNotFoundExceptionImpl) then) =
      __$$FileNotFoundExceptionImplCopyWithImpl<$Res>;
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
}

/// @nodoc

class _$FileNotFoundExceptionImpl extends FileNotFoundException {
  const _$FileNotFoundExceptionImpl() : super._();

  @override
  String toString() {
    return 'AppException.fileNotFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileNotFoundExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? generic,
    TResult Function(Object error)? fromError,
    TResult Function()? fileNotFound,
    TResult Function()? nullValue,
    required TResult orElse(),
  }) {
    if (fileNotFound != null) {
      return fileNotFound();
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
  const factory FileNotFoundException() = _$FileNotFoundExceptionImpl;
  const FileNotFoundException._() : super._();
}

/// @nodoc
abstract class _$$NullValueExceptionImplCopyWith<$Res> {
  factory _$$NullValueExceptionImplCopyWith(_$NullValueExceptionImpl value,
          $Res Function(_$NullValueExceptionImpl) then) =
      __$$NullValueExceptionImplCopyWithImpl<$Res>;
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
}

/// @nodoc

class _$NullValueExceptionImpl extends NullValueException {
  const _$NullValueExceptionImpl() : super._();

  @override
  String toString() {
    return 'AppException.nullValue()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NullValueExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? generic,
    TResult Function(Object error)? fromError,
    TResult Function()? fileNotFound,
    TResult Function()? nullValue,
    required TResult orElse(),
  }) {
    if (nullValue != null) {
      return nullValue();
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
  const factory NullValueException() = _$NullValueExceptionImpl;
  const NullValueException._() : super._();
}
