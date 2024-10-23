import 'model/authentication_user.dart';

/// Abstract class to create an  authentication client for app
abstract class AuthenticationClient {
  /// Stream of current authentication user
  Stream<AuthenticationUser> get user;

  // Sign in with google
  Future<void> signInWithGoogle();

  /// Sets the number of times the app was opened.
  void setAppOpenedCount({required int count});

  /// Fetches the number of times the app was opened value from Storage.
  int fetchAppOpenedCount();

  /// Sets the number of times the app was opened.
  void setUserHasOnboarded();

  /// get if user has  onboarded
  bool getUserHasOnboarded();

  /// Signs out the current user which will emit
  Future<void> signOut();
}
