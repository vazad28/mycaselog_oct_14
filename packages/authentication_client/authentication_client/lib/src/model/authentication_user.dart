import 'package:equatable/equatable.dart';

/// Storage keys for the AuthenticationUserStorage.
abstract class AuthenticationUserStorageKeys {
  /// Number of times that a user opened the application.
  static const appOpenedCount = '__app_opened_count_key__';

  /// Is user onboarded
  static const onboardedStatus = '__user_has_onboarded__';
}

/// {@template authentication_user}
/// User model
///
/// [AuthenticationUser.anonymous] represents an unauthenticated user.
/// {@endtemplate}
class AuthenticationUser extends Equatable {
  /// {@macro authentication_user}
  const AuthenticationUser({
    required this.id,
    this.email,
    this.emailVerified,
    this.name,
    this.photo,
    this.isNewUser = true,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's email address verified
  final bool? emailVerified;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// Whether the current user is a first time user.
  final bool isNewUser;

  /// Whether the current user is anonymous.
  bool get isAnonymous => this == anonymous;

  /// Anonymous user which represents an unauthenticated user.
  static const anonymous = AuthenticationUser(id: 'anonymous');

  /// is user email verifier
  bool get isEmailVerified => emailVerified ?? false;

  @override
  List<Object?> get props => [email, id, name, photo, isNewUser];
}
