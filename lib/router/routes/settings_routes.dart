import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../settings/settings.dart';

import '../../support_data/support_data.dart';
import '../../templates/index.dart';
import '../../user_profile/user_profile.dart';
import '../route_animations/route_animations.dart';

part '../../generated/router/routes/settings_routes.g.dart';

@TypedGoRoute<SettingsRoute>(
  path: SettingsRoute.path,
  routes: <TypedGoRoute<GoRouteData>>[
    /// Templates routes
    TypedGoRoute<TemplatesRoute>(
      path: TemplatesRoute.path,
      name: TemplatesRoute.name,
      routes: [
        TypedGoRoute<AddTemplateRoute>(
          path: AddTemplateRoute.path,
        ),
        // TypedGoRoute<SharedTemplatesRoute>(
        //   path: SharedTemplatesRoute.path,
        // ),
      ],
    ),

    /// assistants route
    TypedGoRoute<AssistantsRoute>(path: AssistantsRoute.path),

    /// Surgery location routes
    TypedGoRoute<SurgeryLocationsRoute>(path: SurgeryLocationsRoute.path),

    /// Anesthesia blocks route
    TypedGoRoute<AnesthesiaBlocksRoute>(path: AnesthesiaBlocksRoute.path),

    /// active basic field
    TypedGoRoute<ActivableFieldsRoute>(path: ActivableFieldsRoute.path),

    /// User Profile route
    TypedGoRoute<UserProfileRoute>(path: UserProfileRoute.path),
  ],
)

/// Root media tab cases
class SettingsRoute extends GoRouteData {
  const SettingsRoute();
  static const name = 'settings';
  static const path = '/$name';

  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: const SettingsPage(),
      );
}

// /// ////////////////////////////////////////////////////////////////////
// /// TEMPLATE ROUTES
// /// ////////////////////////////////////////////////////////////////////
/// all templates route
class TemplatesRoute extends GoRouteData {
  const TemplatesRoute();
  static const name = 'templates';
  static const path = name;

  @override
  TemplatesPage build(BuildContext context, GoRouterState state) =>
      const TemplatesPage();
}

// /// Add template route
class AddTemplateRoute extends GoRouteData {
  AddTemplateRoute(this.templateID);
  static const name = 'add_template';
  static const path = 'add_template/:templateID';
  static const newItemParam = 'new';

  final String templateID;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AddTemplatePage(templateID: templateID);
}

/// assistants Route
class AssistantsRoute extends GoRouteData {
  const AssistantsRoute();
  static const name = 'assistants';
  static const path = name;
  static const newItemParam = 'new';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AssistantsPage();
}

/// Surgery location routes
class SurgeryLocationsRoute extends GoRouteData {
  const SurgeryLocationsRoute();
  static const name = 'surgery_locations';
  static const path = name;
  static const newItemParam = 'new';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SurgeryLocationsPage();
}

/// Anesthesia Blocks route
class AnesthesiaBlocksRoute extends GoRouteData {
  const AnesthesiaBlocksRoute();

  static const name = 'anesthesia_blocks';
  static const path = name;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AnesthesiaBlocksPage();
}

/// Active fields route
class ActivableFieldsRoute extends GoRouteData {
  const ActivableFieldsRoute();
  static const name = 'active_fields';
  static const path = name;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ActivableFieldsPage();
}

/// User profile
class UserProfileRoute extends GoRouteData {
  const UserProfileRoute();
  static const name = 'user_profile';
  static const path = name;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const UserProfilePage();
}
