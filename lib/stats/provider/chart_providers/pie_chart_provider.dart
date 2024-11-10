part of './chart_providers.dart';

class PieChartDataModel {
  PieChartDataModel({
    required this.sections,
    required this.pieTouchData,
    this.error,
  });

  factory PieChartDataModel.zero() =>
      PieChartDataModel(sections: null, pieTouchData: null);

  factory PieChartDataModel.failure(Exception error) =>
      PieChartDataModel(sections: null, pieTouchData: null, error: error);

  final List<PieChartSectionData>? sections;
  final PieTouchData? pieTouchData;
  final Exception? error;
}

@riverpod
class PieChartDataGenerator extends _$PieChartDataGenerator {
  @override
  PieChartDataModel build() {
    final statsDataModelState = ref.watch(statsDataProvider);

    final touchedIndex = ref.watch(touchedIndexProvider);

    return statsDataModelState.maybeWhen(
      success: (statsDataModel) =>
          _createPieChartDataModel(statsDataModel, touchedIndex),
      failure: PieChartDataModel.failure,
      orElse: PieChartDataModel.zero,
    );
  }

  PieChartDataModel _createPieChartDataModel(
    ChartDataModel chartDataModel, [
    int? touchedIndex,
  ]) {
    final pieChartSections = _createPieSections(chartDataModel, touchedIndex);

    return PieChartDataModel(
      sections: pieChartSections,
      pieTouchData: ChartsHelper.pieTouchData(touchedIndex, (int? index) {
        ref.watch(touchedIndexProvider.notifier).update(index);
      }),
    );
  }

  List<PieChartSectionData>? _createPieSections(
    ChartDataModel chartDataModel, [
    int? selectedIndex,
  ]) {
    final factor = 250 ~/ chartDataModel.data.length;
    final textStyle = chartsTheme.textTheme.bodySmall;

    return chartDataModel.data.asMap().entries.map((entry) {
      final idx = entry.key;
      final item = entry.value;
      final isTouched = idx == selectedIndex;

      final fontSize = isTouched ? 18 : 12;
      final radius = isTouched ? 105 : 95;

      return PieChartSectionData(
        color: chartsTheme.onChartColor.withAlpha(255 - factor * idx),
        value: item.data.length.toDouble(),
        title: item.data.length.toString(),
        radius: radius.toDouble(),
        badgeWidget: Text(
          item.label,
          style: textStyle?.copyWith(color: chartsTheme.onChartColor),
        ),
        badgePositionPercentageOffset: 1.25,
        titleStyle: textStyle?.copyWith(
          fontSize: fontSize.toDouble(),
          fontWeight: FontWeight.bold,
          color: chartsTheme.colorScheme.onPrimaryContainer,
        ),
      );
    }).toList();
  }

  void load() {
    ref.notifyListeners();
  }
}
