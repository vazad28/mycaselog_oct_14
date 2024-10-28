part of 'services.dart';

/// Riverpod provider to use the dialog service
@Riverpod(keepAlive: true)
DialogService dialogService(Ref ref) {
  final rootContext = AppVars.appRootNavigatorKey.currentContext;

  if (rootContext == null) throw FlutterError('Root context not available');
  return DialogService(rootContext);
}

class DialogService {
  DialogService(BuildContext rootContext) : _rootContext = rootContext;

  final BuildContext _rootContext;
  BuildContext get rootContext => _rootContext;

  /// show snackbar
  void showSnackBar(String? message, {Duration? duration}) {
    AppVars.appScaffoldMessengerKey.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration ?? const Duration(milliseconds: 4000),
          content: Text(message ?? S.current.noMessage),
          action: SnackBarAction(
            label: S.of(_rootContext).ok,
            textColor: _rootContext.colorScheme.onPrimary,
            onPressed: () {}, // empty function to close snackbar Flutter 3.0
          ),
        ),
      );
  }

  /// for info dialog
  Future<void> showInfoDialog(String message) {
    return _rootContext.showInfoDialog(message);
  }

  /// confirm dialog
  Future<bool> showConfirmDialog(
    String message, {
    String? title,
    String? defaultActionText,
    String? cancelActionText,
  }) {
    return _rootContext.showConfirmDialog(
      message,
      title: title,
      defaultActionText: defaultActionText,
      cancelActionText: cancelActionText,
    );
  }

  /// open date picker
  Future<DateTime?> openDatePicker({
    required DateTime initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    DatePickerMode? initialDatePickerMode,
    Widget Function(BuildContext, Widget?)? builder,
  }) {
    return _rootContext.openDatePicker(
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDatePickerMode: initialDatePickerMode,
      builder: builder,
    );
  }

  /// share files
  Future<Result<ShareResult>> shareFile(
    List<String> filePaths,
    String title,
  ) async {
    try {
      final xFiles = filePaths.map(XFile.new).toList();
      final shareResult = await Share.shareXFiles(xFiles, text: title);
      return Result.value(shareResult);
    } catch (err) {
      return Result.error(Exception(err));
    }
  }

  /// Local auth dialog
  Future<bool> localAuth() async {
    try {
      final localAuth = LocalAuthentication();
      final isAuthenticated = await localAuth.authenticate(
        localizedReason: S.current.biometricAuthMessage,
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      if (isAuthenticated) return true;
      return false;
    } on PlatformException catch (e) {
      await showInfoDialog(e.toString());
      return false;
    } catch (err) {
      showSnackBar(err.toString());
      return false;
    }
  }
}
