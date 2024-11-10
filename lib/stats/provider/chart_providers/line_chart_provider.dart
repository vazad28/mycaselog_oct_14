part of 'chart_providers.dart';

class LineChartDataModel {
  LineChartDataModel({
    required this.showingTooltipIndicators,
    required this.titlesData,
    required this.lineBarsData,
    required this.lineTouchData,
    this.error,
  });

  factory LineChartDataModel.zero() => LineChartDataModel(
        showingTooltipIndicators: null,
        titlesData: null,
        lineBarsData: null,
        lineTouchData: null,
      );

  factory LineChartDataModel.failure(Exception error) => LineChartDataModel(
        showingTooltipIndicators: null,
        titlesData: null,
        lineBarsData: null,
        lineTouchData: null,
        error: error,
      );

  final List<ShowingTooltipIndicators>? showingTooltipIndicators;
  final FlTitlesData? titlesData;
  final List<LineChartBarData>? lineBarsData;
  final LineTouchData? lineTouchData;
  final Exception? error;
}

@riverpod
class LineChartDataGenerator extends _$LineChartDataGenerator {
  @override
  LineChartDataModel build() {
    final statsDataModelState = ref.watch(statsDataProvider);

    final touchedIndex = ref.watch(touchedIndexProvider);

    final indexes =
        (touchedIndex != null && touchedIndex != -1) ? [touchedIndex] : null;

    return statsDataModelState.maybeWhen(
      success: (statsDataModel) => _createLineChartDataModel(
        statsDataModel,
        indexes,
        touchedIndex,
      ),
      failure: LineChartDataModel.failure,
      orElse: LineChartDataModel.zero,
    );
  }

  LineChartDataModel _createLineChartDataModel(
    ChartDataModel chartDataModel, [
    List<int>? indexes,
    int? touchedIndex,
  ]) {
    final lineBarsData = _createDataGroups(indexes, _allSpots(chartDataModel));

    final chartsTheme = ChartsTheme();

    return LineChartDataModel(
      lineBarsData: lineBarsData,
      lineTouchData: ChartsHelper.lineTouchData(
          chartsTheme.colorScheme, touchedIndex, (int? index) {
        ref.watch(touchedIndexProvider.notifier).update(index);
      }),
      titlesData: ChartsHelper.createChartTitlesData(chartDataModel),
      showingTooltipIndicators: indexes?.map((index) {
        return ShowingTooltipIndicators([
          LineBarSpot(lineBarsData.first, 0, lineBarsData.first.spots[index]),
        ]);
      }).toList(),
    );
  }

  List<FlSpot> _allSpots(ChartDataModel chartDataModel) {
    final spots = chartDataModel.data.asMap().entries.map((entry) {
      final idx = entry.key;
      final item = entry.value;
      return FlSpot(idx.toDouble(), item.data.length.toDouble());
    }).toList();
    return spots;
  }

  List<LineChartBarData> _createDataGroups(
    List<int>? showIndexes,
    List<FlSpot> allSpots,
  ) {
    final lineChartSet = LineChartBarData(
      showingIndicators: showIndexes ?? [],
      spots: allSpots,
      isCurved: true,
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            chartsTheme.onChartColor.withAlpha(50),
            chartsTheme.chartBackgroundColor.withAlpha(100),
          ],
        ),
      ),
      color: chartsTheme.onChartColor,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
    );

    return [lineChartSet];
  }

  void load() {
    ref.notifyListeners();
  }
}
