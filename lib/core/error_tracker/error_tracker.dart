import 'dart:async';
import 'dart:developer' as developer;
import 'dart:isolate';

//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_logger_plus/flutter_logger_plus.dart';
import 'package:utils/utils.dart';

import '../app_vars.dart';

final errorTracker = _ErrorTracker();

class _ErrorTracker {
  /// Create as singleton class
  factory _ErrorTracker() => _singleton;

  _ErrorTracker._internal();
  static final _ErrorTracker _singleton = _ErrorTracker._internal();

  /// Base method to manage Flutter Errors
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        logger.info('App in dev mode ..');
        return;
      }

      await _initErrorTrackers();

      FlutterError.onError = _onFlutterError;

      Isolate.current.addErrorListener(
        RawReceivePort((List<dynamic> pair) async {
          final errorAndStacktrace = pair;
          // await FirebaseCrashlytics.instance.recordError(
          //   errorAndStacktrace.first,
          //   errorAndStacktrace.last as StackTrace?,
          //   fatal: true,
          //);
          // ignore: use_build_context_synchronously
          restartUtils.silentRestart(AppVars.rootContext);
        }).sendPort,
      );

      // Pass all uncaught asynchronous errors that aren't handled by the
      // Flutter framework to Crashlytics
      PlatformDispatcher.instance.onError = (error, stack) {
        //FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
    } catch (e) {
      logger.error('Error handling error $e');
    }
  }

  // Future<void> captureError(
  //   Object error,
  //   StackTrace? stackTrace, {
  //   dynamic hint,
  // }) async {
  //   await Future.wait([
  //     if (error is FlutterErrorDetails)
  //       FirebaseCrashlytics.instance.recordFlutterFatalError(error),
  //     //Sentry.captureException(error, stackTrace: stackTrace, hint: hint),
  //   ]);
  //   logger.success('SUCCESS capture error');
  // }

  // Future<void> addBreadCrumb(
  //   String message, {
  //   /// A dictionary whose contents depend on the breadcrumb type. Additional
  //   /// parameters that are unsupported by the type are rendered as a key/value
  //   /// table.
  //   Map<String, dynamic>? data,

  //   /// A dotted string indicating what the crumb is or from where it comes.
  //   /// Typically it is a module name or a descriptive string. For instance,
  //   /// ui.click could be used to indicate that a click happened in the UI or
  //   /// flask could be used to indicate the event originated in that framework.
  //   String? category,
  //   BreadCrumbType type = BreadCrumbType.default_,
  // }) async {
  //   // await Sentry.addBreadcrumb(Breadcrumb(
  //   //   message: message,
  //   //   data: data,
  //   //   category: category,
  //   //   type: type.value(),
  //   //   timestamp: DateTime.now(),
  //   // ));
  //   await FirebaseCrashlytics.instance
  //       .log(message + (data != null ? ': $data' : ''));
  // }

  Future<void> log(Object error, [StackTrace? stacktrace]) async {
    logger.error(error.toString());
    if (stacktrace != null) {
      developer.log('DevLog:', error: error, stackTrace: stacktrace);
    }
    // await Future.wait([
    //   FirebaseCrashlytics.instance.log(message),
    //   //Sentry.captureMessage(message),
    // ]);
  }

  // void setPhone(String phone) {
  //   _phone = phone;
  //   _setSentryUser();
  // }

//   void setUser(User user) async {
//     _user = user;
//     _phone = user.phoneNumber ?? _phone;
//     _setSentryUser();
//     await FirebaseCrashlytics.instance.setUserIdentifier(user.uid);
//   }

//   void _setSentryUser() {
//     Sentry.configureScope((scope) {
//       scope.user = SentryUser(
//         id: _user?.uid,
//         email: _user?.email,
//         extras: {'phone': _phone ?? scope.user?.extras?['phone']},
//       );
//     });
//   }
// }

  // Future<void> _initSentry(String station) async {
  //   try {
  //     await SentryFlutter.init(
  //       (options) {
  //         options.environment = sentryEnvironment;
  //         options.dsn = sentryDSN;
  //         options.tracesSampleRate = 0.1;
  //         options.sendDefaultPii = true;
  //         if (!kDebugMode) {
  //           options.debug = true;
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     throw "Unable to initialize sentry";
  //   }
  //   Sentry.configureScope((scope) => scope.setTag('station', station));
  // }

  /// ////////////////////////////////////////////////////////////////////
  /// Local methods
  /// ////////////////////////////////////////////////////////////////////

  /// Initialize FirebaseCrashlytics instance
  Future<void> _initErrorTrackers() async {
    await Future.wait([
      //_initSentry(station),
      //FirebaseCrashlytics.instance.setCustomKey('station', station),
    ]);
  }

  void _onFlutterError(FlutterErrorDetails e) {
    //FirebaseCrashlytics.instance.recordFlutterError(e);
    FlutterError.dumpErrorToConsole(e);
  }
}
