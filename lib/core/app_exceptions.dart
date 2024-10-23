import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/core/app_exceptions.freezed.dart';

//part 'localized_failures.dart';

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
}
