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
  const factory AppException.generic(String error) = GenericAppException;

  /// Generic app exception from  try and catch error
  const factory AppException.fromError(Object error) = FromErrorAppException;

  /// file not found
  const factory AppException.fileNotFound() = FileNotFoundException;

  /// Null value
  const factory AppException.nullValue() = NullValueException;
}
