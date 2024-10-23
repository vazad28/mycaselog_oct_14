import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_exception.freezed.dart';

@Freezed(
  copyWith: true,
  equal: true,
  when: FreezedWhenOptions(when: false, maybeWhen: true, whenOrNull: false),
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
  fromJson: false,
  toJson: false,
)
class AuthenticationException
    with _$AuthenticationException
    implements Exception {
  const AuthenticationException._();

  const factory AuthenticationException.signInCancelledException(
    Object? error,
  ) = SignInCancelledException;

  const factory AuthenticationException.googleSignInException(Object? error) =
      GoogleSignInException;

  const factory AuthenticationException.signOutException(Object? error) =
      SignOutException;
}
