import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/core.dart';
import '../routes/routes.dart';
import '../views/page_not_found.dart';
import 'routes_provider.dart';

part '../../generated/router/providers/app_router.g.dart';

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
