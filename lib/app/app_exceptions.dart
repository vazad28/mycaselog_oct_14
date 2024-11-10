import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/app/app_exceptions.freezed.dart';

@Freezed(
  copyWith: true,
  equal: true,
  when: FreezedWhenOptions(when: false, maybeWhen: true, whenOrNull: false),
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
  fromJson: false,
  toJson: false,
)
class AppException with _$AppException implements Exception {
  const AppException._();

  /// Generic app exception
  const factory AppException.generic([Object? message]) = GenericAppException;

  /// Generic app exception from  try and catch error
  const factory AppException.fromError([Object? message]) =
      FromErrorAppException;

  /// file not found
  const factory AppException.fileNotFound([Object? message]) =
      FileNotFoundException;

  /// Null value
  const factory AppException.nullValue([Object? message]) = NullValueException;
}

extension ExceptionExtension on Exception {
  String get message {
    if (this is AppException) {
      return (this as AppException).message?.toString() ?? 'No error message';
    } else if (toString().startsWith('Exception: ')) {
      return toString().substring(11);
    } else {
      return toString(); // Or provide a default message
    }
  }
}
