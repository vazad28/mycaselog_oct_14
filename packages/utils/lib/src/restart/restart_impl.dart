import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

import 'restart.dart';
import 'restart_widget.dart';

class RestartClassImpl extends RestartClass {
  static const maxNumberOfRestartTries = 10;

  @override
  Future<bool?> restart() async {
    final result = await Restart.restartApp();
    if (!result) {
      throw Error.throwWithStackTrace(
        'Unable to restart the app',
        StackTrace.current,
      );
    }
    return result;
  }

  @override
  void silentRestart(BuildContext? context) {
    var numOfRetries = 0;

    // Some errors occurs every time, and in that case restart app goes to an
    // infinite loop, to prevent that we take a track of restart
    // and if it exceeds the number, we exit the app
    try {
      if (numOfRetries == maxNumberOfRestartTries ||
          numOfRetries > maxNumberOfRestartTries) {
        exit(0);
      }

      if (context != null) {
        RestartWidget.restartApp(context);
        numOfRetries++;
        return;
      }

      numOfRetries++;
      restart();
    } catch (e) {
      exit(0);
    }
  }
}
