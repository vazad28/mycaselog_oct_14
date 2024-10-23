// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_of.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StateOf<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(T? data) initialized,
    required TResult Function(String? message) loading,
    required TResult Function(T data) success,
    required TResult Function(Exception e) failure,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(T? data)? initialized,
    TResult Function(String? message)? loading,
    TResult Function(T data)? success,
    TResult Function(Exception e)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_failure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$initImpl<T> extends _init<T> {
  const _$initImpl() : super._();

  @override
  String toString() {
    return 'StateOf<$T>.init()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(T? data) initialized,
    required TResult Function(String? message) loading,
    required TResult Function(T data) success,
    required TResult Function(Exception e) failure,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(T? data)? initialized,
    TResult Function(String? message)? loading,
    TResult Function(T data)? success,
    TResult Function(Exception e)? failure,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_failure<T> value) failure,
  }) {
    return init(this);
  }
}

abstract class _init<T> extends StateOf<T> {
  const factory _init() = _$initImpl<T>;
  const _init._() : super._();
}

/// @nodoc

class _$initializedImpl<T> extends _initialized<T> {
  const _$initializedImpl([this.data]) : super._();

  @override
  final T? data;

  @override
  String toString() {
    return 'StateOf<$T>.initialized(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(T? data) initialized,
    required TResult Function(String? message) loading,
    required TResult Function(T data) success,
    required TResult Function(Exception e) failure,
  }) {
    return initialized(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(T? data)? initialized,
    TResult Function(String? message)? loading,
    TResult Function(T data)? success,
    TResult Function(Exception e)? failure,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_failure<T> value) failure,
  }) {
    return initialized(this);
  }
}

abstract class _initialized<T> extends StateOf<T> {
  const factory _initialized([final T? data]) = _$initializedImpl<T>;
  const _initialized._() : super._();

  T? get data;
}

/// @nodoc

class _$loadingImpl<T> extends _loading<T> {
  const _$loadingImpl([this.message]) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'StateOf<$T>.loading(message: $message)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(T? data) initialized,
    required TResult Function(String? message) loading,
    required TResult Function(T data) success,
    required TResult Function(Exception e) failure,
  }) {
    return loading(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(T? data)? initialized,
    TResult Function(String? message)? loading,
    TResult Function(T data)? success,
    TResult Function(Exception e)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_failure<T> value) failure,
  }) {
    return loading(this);
  }
}

abstract class _loading<T> extends StateOf<T> {
  const factory _loading([final String? message]) = _$loadingImpl<T>;
  const _loading._() : super._();

  String? get message;
}

/// @nodoc

class _$successImpl<T> extends _success<T> {
  const _$successImpl(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'StateOf<$T>.success(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(T? data) initialized,
    required TResult Function(String? message) loading,
    required TResult Function(T data) success,
    required TResult Function(Exception e) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(T? data)? initialized,
    TResult Function(String? message)? loading,
    TResult Function(T data)? success,
    TResult Function(Exception e)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_failure<T> value) failure,
  }) {
    return success(this);
  }
}

abstract class _success<T> extends StateOf<T> {
  const factory _success(final T data) = _$successImpl<T>;
  const _success._() : super._();

  T get data;
}

/// @nodoc

class _$failureImpl<T> extends _failure<T> {
  const _$failureImpl(this.e) : super._();

  @override
  final Exception e;

  @override
  String toString() {
    return 'StateOf<$T>.failure(e: $e)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(T? data) initialized,
    required TResult Function(String? message) loading,
    required TResult Function(T data) success,
    required TResult Function(Exception e) failure,
  }) {
    return failure(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(T? data)? initialized,
    TResult Function(String? message)? loading,
    TResult Function(T data)? success,
    TResult Function(Exception e)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_failure<T> value) failure,
  }) {
    return failure(this);
  }
}

abstract class _failure<T> extends StateOf<T> {
  const factory _failure(final Exception e) = _$failureImpl<T>;
  const _failure._() : super._();

  Exception get e;
}
