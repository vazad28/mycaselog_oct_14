part of 'providers.dart';

/// Firebase Auth Instance for use all through the app
@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuthInstance(Ref ref) {
  return throw UnimplementedError();
}

/// Firebase Auth Instance for use all through the app
@Riverpod(keepAlive: true)
AuthenticationClient authenticationClient(Ref ref) {
  return FirebaseAuthenticationClient(
    storage: ref.watch(persistentStorageProvider),
    firebaseAuth: ref.watch(firebaseAuthInstanceProvider),
  );
}

/// Local stream listener provider of the auth state
@Riverpod(keepAlive: true)
Stream<AuthenticationUser> authenticationUserStream(
  Ref ref,
) {
  return ref.watch(authenticationClientProvider).user;
}

/// Authenticated user provider
///
/// Exposes User in a non async manner as regular provider
@Riverpod(keepAlive: true)
AuthenticationUser authenticationUser(Ref ref) {
  final asyncValue = ref.watch(authenticationUserStreamProvider);

  return asyncValue.maybeWhen(
    data: (value) => value,
    orElse: () => AuthenticationUser.anonymous,
  );
}

@riverpod
String userID(Ref ref) {
  return ref.watch(authenticationUserProvider).id;
}

/// ////////////////////////////////////////////////////////////////////
/// Passocde provider
/// ////////////////////////////////////////////////////////////////////

/// set to value of the user clustom claims containing the passcode
final passcodeProvider = StateProvider<String>((ref) => '');
