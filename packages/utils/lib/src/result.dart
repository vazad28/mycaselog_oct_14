import 'package:async/async.dart';

extension ResultExtensions<T> on Result<T> {
  void when({
    required void Function(T value) success,
    required void Function(Object error) failure,
  }) {
    if (isValue) {
      success(asValue!.value);
    } else {
      failure(asError!.error);
    }
  }
}
