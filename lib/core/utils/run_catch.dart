import 'dart:async';

import 'package:async/async.dart';
import 'package:utils/utils.dart';

import '../core.dart';

class GenericException implements Exception {
  GenericException(this.err);

  final Object? err;
}

Future<Result<T>> runCatchAsync<T>(Future<T> Function() future) async {
  try {
    return Result.value(await future());
  } on Exception catch (e, st) {
    errorTracker.log(e, st);
    return Result.error(e);
  } catch (err) {
    return Result.error(Exception(err));
  }
}

extension ResultX on Result {
  StateOf<T> toStateOf<T>() => isValue
      ? StateOf<dynamic>.success(asValue!.value) as StateOf<T>
      : StateOf<dynamic>.failure(
          asError!.error is Exception
              ? asError!.error as Exception
              : Exception(asError!.error),
        ) as StateOf<T>;
}
