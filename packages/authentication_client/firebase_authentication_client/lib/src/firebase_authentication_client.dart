import 'package:authentication_client/authentication_client.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:storage/storage.dart';

/// Authentication client using firebase for authentication
class FirebaseAuthenticationClient extends AuthenticationClient {
  FirebaseAuthenticationClient({
    required PersistentStorage storage,
    required firebase_auth.FirebaseAuth firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _storage = storage,
        _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final PersistentStorage _storage;

  /// Stream of [AuthenticationUser] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [AuthenticationUser.anonymous] if the user is not authenticated.
  @override
  Stream<AuthenticationUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      //print(firebaseUser?.toString());
      return firebaseUser == null
          ? AuthenticationUser.anonymous
          : firebaseUser.toUser;
    });
  }

  // Implement signInWithGoogle method
  @override
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw const AuthenticationException.signInCancelledException(null);
      }
      final googleAuth = await googleUser.authentication;

      //print(googleAuth.accessToken);
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } on SignInCancelledException {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        AuthenticationException.googleSignInException(error),
        stackTrace,
      );
    }
  }

  /// Signs out the current user which will emit
  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on SignOutException {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(SignOutException(error), stackTrace);
    }
  }

  /// ////////////////////////////////////////////////////////////////////
  /// User storage
  /// ////////////////////////////////////////////////////////////////////
  /// Sets the number of times the app was opened.
  @override
  void setAppOpenedCount({required int count}) => _storage.writeInt(
        AuthenticationUserStorageKeys.appOpenedCount,
        count,
      );

  /// Fetches the number of times the app was opened value from Storage.
  @override
  int fetchAppOpenedCount() {
    return _storage.readInt(AuthenticationUserStorageKeys.appOpenedCount, 0);
  }

  /// Sets the number of times the app was opened.
  @override
  void setUserHasOnboarded() => _storage.writeBool(
        AuthenticationUserStorageKeys.onboardedStatus,
        true,
      );

  @override
  bool getUserHasOnboarded() =>
      _storage.readBool(AuthenticationUserStorageKeys.onboardedStatus, false);
}

///  Map firebase user data to instance of AuthenticationClient's user
extension on firebase_auth.User {
  AuthenticationUser get toUser {
    return AuthenticationUser(
      id: uid,
      email: email,
      name: displayName,
      photo: photoURL,
      //emailVerified: emailVerified,
      isNewUser: metadata.creationTime == metadata.lastSignInTime,
    );
  }
}
