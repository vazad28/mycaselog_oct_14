import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

import 'app/app.dart';
//import 'core/config/firebase_options.dart';
import 'core/error_tracker/error_tracker.dart';
import 'firebase_options.dart';

Future<void> main() async => _init();

Future<void> _init() async {
  await runZonedGuarded<Future<void>>(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      // Keep native splash screen up until app is finished bootstrapping
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      // * Initialize Firebase
      final app = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      final firebaseAuthInstance = FirebaseAuth.instanceFor(app: app);

      /// Specifies the style to use for overlays like status bar
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
      );

      // add error observers & handle them
      await errorTracker.initialize();

      /// bootstrap function initializes all async data and providers
      final providerContainer = await bootstrap(firebaseAuthInstance);

      final appWidget = PopScope(
        onPopInvokedWithResult: (bool didPop, result) => {},
        child: TapOutsideUnfocus(
          child: AppStartupWidget(
            onAuthentication: (context) => const MycaselogApp(),
            needsAuthentication: (context) => const MycaselogAuthApp(),
          ),
        ),
      );

      runApp(
        RestartWidget(
          child: UncontrolledProviderScope(
            container: providerContainer,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: appWidget,
            ),
          ),
        ),
      );

      // Remove splash screen when bootstrap is complete
      FlutterNativeSplash.remove();
    },
    errorTracker.log,
  );
}
