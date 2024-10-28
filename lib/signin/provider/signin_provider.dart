import 'package:authentication_client/authentication_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/providers/providers.dart';
part './signin_state.dart';
part './signin_mixin.dart';

part '../../generated/signin/provider/signin_provider.g.dart';
part '../../generated/signin/provider/signin_provider.freezed.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@riverpod
class SigninNotifier extends _$SigninNotifier {
  @override
  SigninState build() {
    return const SigninState.initial();
  }

  /// Map events to state
  void on(SigninEvent event) {
    event.map(
      signinAppleSubmitted: (_) => _onSigninAppleSubmitted(),
      signinGoogleSubmitted: (_) => _onSigninGoogleSubmitted(),
      signinFacebookSubmitted: (_) => _signinFacebookSubmitted(),
      signinWithEmailSubmitted: (_) => _signinWithEmailSubmitted(),
    );
  }

  Future<void> _onSigninGoogleSubmitted() async {
    state = const SigninState.loading();
    try {
      await ref.watch(authenticationClientProvider).signInWithGoogle();
    } on SignInCancelledException {
      state = const SigninState.cancelled();
    } on GoogleSignInException catch (err) {
      state = SigninState.failure(GoogleSignInException(err));
    } catch (err) {
      state = SigninState.failure(Exception(err));
    }
  }

  Object? _onSigninAppleSubmitted() {
    throw UnimplementedError();
  }

  Object? _signinFacebookSubmitted() {
    throw UnimplementedError();
  }

  Object? _signinWithEmailSubmitted() {
    throw UnimplementedError();
  }
}
