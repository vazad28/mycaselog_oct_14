import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:l10n/l10n.dart';

enum DialogType { info, confirm, warning, error }

class DialogModel {

  DialogModel({
    this.content,
    this.title,
    this.cancelActionText,
    this.defaultActionText,
  });

  /// info dialog model
  factory DialogModel.info(Widget content, [String? title]) => DialogModel(
        title: title,
        content: content,
        defaultActionText: S.current.ok, // Replace with your localization
      );

  /// confirm dialog model
  factory DialogModel.confirm(Widget content, [String? title]) => DialogModel(
        title: title,
        content: content,
        defaultActionText: S.current.yes, // Replace with your localization
        cancelActionText: S.current.cancel, // Replace with your localization
      );
  final Widget? content;
  final String? title;
  final String? cancelActionText;
  final String? defaultActionText;

  DialogModel copyWith({
    Widget? content,
    String? title,
    String? cancelActionText,
    String? defaultActionText,
  }) =>
      DialogModel(
        content: content ?? this.content,
        title: title ?? this.title,
        cancelActionText: cancelActionText ?? this.cancelActionText,
        defaultActionText: defaultActionText ?? this.defaultActionText,
      );
}

class InputDialogModel {

  InputDialogModel({
    this.title,
    this.cancelActionText,
    this.defaultActionText,
    this.obscureText = false,
    this.value,
    this.placeholderText,
    this.textCapitalization,
    this.inputFormatters,
    this.multiline = false,
  });
  final String? title;
  final String? cancelActionText;
  final String? defaultActionText;
  final bool obscureText;
  final String? value;
  final String? placeholderText;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final bool multiline;

  InputDialogModel copyWith({
    String? title,
    String? cancelActionText,
    String? defaultActionText,
    bool? obscureText,
    String? value,
    String? placeholderText,
    TextCapitalization? textCapitalization,
    List<TextInputFormatter>? inputFormatters,
    bool? multiline,
  }) =>
      InputDialogModel(
        title: title ?? this.title,
        cancelActionText: cancelActionText ?? this.cancelActionText,
        defaultActionText: defaultActionText ?? this.defaultActionText,
        obscureText: obscureText ?? this.obscureText,
        value: value ?? this.value,
        placeholderText: placeholderText ?? this.placeholderText,
        textCapitalization: textCapitalization ?? this.textCapitalization,
        inputFormatters: inputFormatters ?? this.inputFormatters,
        multiline: multiline ?? this.multiline,
      );
}
