import 'dart:async';

import 'package:authentication_client/authentication_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../router/router.dart';
import '../../shared/providers/providers.dart';

part '../../generated/auth_flow/provider/auth_flow_provider.freezed.dart';
part '../../generated/auth_flow/provider/auth_flow_provider.g.dart';

part 'auth_flow_state.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@riverpod
class AuthFlowNotifier extends _$AuthFlowNotifier {
  @override
  AuthFlowState build() {
    _authenticationClient = ref.watch(authenticationClientProvider);
    _authenticationUser = ref.read(authenticationUserProvider);

    /// user change stream
    _userSubscription = _authenticationClient.user.listen(_userChanged);

    ref.onDispose(() => _userSubscription.cancel());

    return _getAuthState(_authenticationUser);
  }

  late final AuthenticationUser _authenticationUser;
  late StreamSubscription<AuthenticationUser> _userSubscription;
  late AuthenticationClient _authenticationClient;

  void onOnboardingCompleted() {
    if (state.isUnboarded) {
      _authenticationClient.setUserHasOnboarded();
      _authenticationUser == AuthenticationUser.anonymous
          ? state = const AuthFlowState.unauthenticated()
          : state = const AuthFlowState.authenticated();
    }
  }

  void _userChanged(AuthenticationUser user) {
    state = _getAuthState(user);
  }

  AuthFlowState _getAuthState(AuthenticationUser user) {
    return user.isAnonymous && !_authenticationClient.getUserHasOnboarded()
        ? const AuthFlowState.unboarded()
        : user == AuthenticationUser.anonymous
            ? const AuthFlowState.unauthenticated()
            : const AuthFlowState.authenticated();
  }

  void onLogoutRequested() {
    // We are disabling notifications when a user logs out because
    // the user should not receive any notifications when logged out.
    // unawaited(_notificationsRepository.toggleNotifications(enable: false));
    unawaited(_authenticationClient.signOut());

    ref.invalidate(appRouterProvider);
  }
}
