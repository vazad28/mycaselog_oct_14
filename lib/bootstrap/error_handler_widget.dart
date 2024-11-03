import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ErrorHandlerWidget extends StatefulWidget {
  const ErrorHandlerWidget({required this.child, super.key});
  final Widget child;

  @override
  _ErrorHandlerWidgetState createState() => _ErrorHandlerWidgetState();
}

class _ErrorHandlerWidgetState extends State<ErrorHandlerWidget> {
  // Error handling logic
  void onError(FlutterErrorDetails errorDetails) {
    // Add your error handling logic here, e.g., logging, reporting to a server, etc.
    if (kDebugMode) {
      print('Caught error: ${errorDetails.exception}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ErrorWidgetBuilder(
      builder: (context, errorDetails) {
        // Display a user-friendly error screen
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(
            child: Text('Something went wrong. Please try again later.'),
          ),
        );
      },
      onError: onError,
      child: widget.child,
    );
  }
}

class ErrorWidgetBuilder extends StatefulWidget {
  const ErrorWidgetBuilder({
    required this.builder,
    required this.onError,
    required this.child,
    super.key,
  });
  final Widget Function(BuildContext, FlutterErrorDetails) builder;
  final void Function(FlutterErrorDetails) onError;
  final Widget child;

  @override
  _ErrorWidgetBuilderState createState() => _ErrorWidgetBuilderState();
}

class _ErrorWidgetBuilderState extends State<ErrorWidgetBuilder> {
  @override
  void initState() {
    super.initState();
    // Set up global error handling
    FlutterError.onError = widget.onError;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
