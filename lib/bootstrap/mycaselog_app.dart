import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:ui/ui.dart';

import '../app/app.dart';
import '../router/router.dart';
import '../settings/settings.dart';
import 'error_handler_widget.dart';

class MycaselogApp extends ConsumerWidget {
  const MycaselogApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(currentThemeProvider(context));

    final materialApp = MaterialApp.router(
      routerConfig: ref.read(appRouterProvider),
      scaffoldMessengerKey: AppVars.appScaffoldMessengerKey,
      theme: currentTheme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      builder: (context, widget) {
        if (widget != null) return ErrorHandlerWidget(child: widget);
        throw StateError('widget is null');

        // Widget error = const Text('...rendering error...');
        // if (widget is Scaffold || widget is Navigator) {
        //   error = Scaffold(body: Center(child: error));
        // }
        // ErrorWidget.builder = (errorDetails) => error;
        // if (widget != null) return widget;
        // throw StateError('widget is null');
      },
    );

    return AsyncValueWidget(
      value: ref.watch(appStartUpProvider),
      data: (_) => _MycaselogApp(child: materialApp),
      loading: _MyCaselogLoading(currentTheme: currentTheme),
    );
  }
}

class _MycaselogApp extends ConsumerWidget {
  const _MycaselogApp({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(databaseErrorStreamProvider, (_, exception) {
      if (!exception.hasValue) return;
      ref.read(dialogServiceProvider).showSnackBar(exception.value?.error);
    });
    // Eagerly initialize providers by watching them.
    // By using "watch", the provider will stay alive and not be disposed.
    // since child is not rebuilding this watch will not  rebuild
    ref.watch(settingsNotifierProvider);
    return child;
  }
}

class _MyCaselogLoading extends StatelessWidget {
  const _MyCaselogLoading({required this.currentTheme});

  final ThemeData currentTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Material(
        type: MaterialType.card,
        color: currentTheme.colorScheme.surface,
        child: Center(
          child: Text(
            AppVars.appName
                .toUpperCase(), // Cant use L10n as this is outside of mycaselogApp
            style: currentTheme.textTheme.titleMedium
                ?.copyWith(color: currentTheme.colorScheme.onSurface),
          ),
        ),
      ),
    );
  }
}
