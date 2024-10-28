part of 'providers.dart';

/// A state provider holding the state for the visibility of the
/// bottom navigation bar
@Riverpod(keepAlive: true)
class AppRouter extends _$AppRouter {
  @override
  GoRouter build() {
    final router = GoRouter(
      navigatorKey: AppVars.appRootNavigatorKey,
      initialLocation: CasesRoute.path,
      routes: ref.read(routesProvider),
      errorPageBuilder: (context, state) => const NoTransitionPage(
        child: PageNotFoundScreen(),
      ),
      //redirect: _redirector,
    );

    return router;
  }
}
