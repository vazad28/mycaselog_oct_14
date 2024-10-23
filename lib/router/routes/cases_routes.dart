import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../cases/cases.dart';
import '../route_animations/route_animations.dart';

part '../../generated/router/routes/cases_routes.g.dart';

@TypedGoRoute<CasesRoute>(
  path: CasesRoute.path,
  routes: <TypedGoRoute<GoRouteData>>[
    // TypedGoRoute<CaseDetailsRoute>(path: CaseDetailsRoute.path),
    // TypedGoRoute<CasePdfRoute>(path: CasePdfRoute.path),
    // TypedGoRoute<AddCaseRoute>(path: AddCaseRoute.path),
  ],
)

/// Root tab cases
class CasesRoute extends GoRouteData {
  const CasesRoute();
  static const name = 'cases';
  static const path = '/$name';

  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: const CasesPage(),
      );
}
