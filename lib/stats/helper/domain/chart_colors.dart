import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

// extension ChartColorsExt on BuildContext {
//   /// chart colors scheme
//   Color get chartBackgroundColor =>
//       Theme.of(this).brightness == Brightness.light
//           ? Theme.of(this).colorScheme.primary
//           : Theme.of(this).colorScheme.surfaceTint;

//   Color get chartBackgroundColorDarker => chartBackgroundColor.darker();
//   Color get onChartColor => Theme.of(this).colorScheme.onPrimary;

//   /// stats timer colors
//   Color get chartTimerBackgroundColor => chartBackgroundColor;
//   Color get chartTimerInactiveColor => Theme.of(this).colorScheme.onPrimary;
//   Color get chartTimerInactiveOnColor => Theme.of(this).colorScheme.primary;
//   Color get chartTimerActiveColor => Theme.of(this).colorScheme.onPrimary;
//   Color get chartTimerActiveOnColor => Theme.of(this).colorScheme.primary;
// }

final chartsTheme = ChartsTheme();

class ChartsTheme {
  factory ChartsTheme() => _instance;
  ChartsTheme._internal();
  static final _instance = ChartsTheme._internal();

  void initialize(BuildContext context) {
    if (!_isInitialized) {
      _themeData = Theme.of(context);
      _isInitialized = true;
    }
  }

  late final ThemeData _themeData;
  bool _isInitialized = false;

  ColorScheme get colorScheme => _themeData.colorScheme;
  TextTheme get textTheme => _themeData.textTheme;

  /// chart colors scheme
  Color get chartBackgroundColor => _themeData.brightness == Brightness.light
      ? _themeData.colorScheme.primary
      : _themeData.colorScheme.surfaceTint;

  Color get chartBackgroundColorDarker => chartBackgroundColor.darker();
  Color get onChartColor => _themeData.colorScheme.onPrimary;

  /// stats timer colors
  Color get chartTimerBackgroundColor => chartBackgroundColor;
  Color get chartTimerInactiveColor => _themeData.colorScheme.onPrimary;
  Color get chartTimerInactiveOnColor => _themeData.colorScheme.primary;
  Color get chartTimerActiveColor => _themeData.colorScheme.onPrimary;
  Color get chartTimerActiveOnColor => _themeData.colorScheme.primary;
}
