// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../router/routes/settings_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $settingsRoute,
    ];

RouteBase get $settingsRoute => GoRouteData.$route(
      path: '/settings',
      factory: $SettingsRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'templates',
          name: 'templates',
          factory: $TemplatesRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'add_template/:templateID',
              factory: $AddTemplateRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'assistants',
          factory: $AssistantsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'surgery_locations',
          factory: $SurgeryLocationsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'anesthesia_blocks',
          factory: $AnesthesiaBlocksRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'active_fields',
          factory: $ActivableFieldsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'user_profile',
          factory: $UserProfileRouteExtension._fromState,
        ),
      ],
    );

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TemplatesRouteExtension on TemplatesRoute {
  static TemplatesRoute _fromState(GoRouterState state) =>
      const TemplatesRoute();

  String get location => GoRouteData.$location(
        '/settings/templates',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddTemplateRouteExtension on AddTemplateRoute {
  static AddTemplateRoute _fromState(GoRouterState state) => AddTemplateRoute(
        state.pathParameters['templateID']!,
      );

  String get location => GoRouteData.$location(
        '/settings/templates/add_template/${Uri.encodeComponent(templateID)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AssistantsRouteExtension on AssistantsRoute {
  static AssistantsRoute _fromState(GoRouterState state) =>
      const AssistantsRoute();

  String get location => GoRouteData.$location(
        '/settings/assistants',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SurgeryLocationsRouteExtension on SurgeryLocationsRoute {
  static SurgeryLocationsRoute _fromState(GoRouterState state) =>
      const SurgeryLocationsRoute();

  String get location => GoRouteData.$location(
        '/settings/surgery_locations',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AnesthesiaBlocksRouteExtension on AnesthesiaBlocksRoute {
  static AnesthesiaBlocksRoute _fromState(GoRouterState state) =>
      const AnesthesiaBlocksRoute();

  String get location => GoRouteData.$location(
        '/settings/anesthesia_blocks',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ActivableFieldsRouteExtension on ActivableFieldsRoute {
  static ActivableFieldsRoute _fromState(GoRouterState state) =>
      const ActivableFieldsRoute();

  String get location => GoRouteData.$location(
        '/settings/active_fields',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UserProfileRouteExtension on UserProfileRoute {
  static UserProfileRoute _fromState(GoRouterState state) =>
      const UserProfileRoute();

  String get location => GoRouteData.$location(
        '/settings/user_profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}