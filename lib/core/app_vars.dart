import 'package:flutter/material.dart';

class AppVars {
  static const String appName = 'Mycaselog';

  /// Write a new UniqueKey to this to restart the app
  final ValueNotifier<UniqueKey> appRestartNotifier =
      ValueNotifier(UniqueKey());

  /// Catcher Report Mode requires a NavigatorKey
  static final GlobalKey<NavigatorState> appRootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  /// Scaffold messenger key for use in catcher
  static final GlobalKey<ScaffoldMessengerState> appScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static BuildContext _getContext() {
    final context = appScaffoldMessengerKey.currentState?.context;
    if (context != null && context.mounted) {
      return context;
    }
    throw Error.throwWithStackTrace(
        'Root context not available', StackTrace.current,);
  }

  /// Root context
  static BuildContext get rootContext => _getContext();
}
