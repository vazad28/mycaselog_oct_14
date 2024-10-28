import 'dart:io' show File;

import 'package:csv/csv.dart';
import 'package:flutter_logger_plus/flutter_logger_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils/utils.dart';

import '../../app/app.dart';
import '../../core/core.dart';

part '../../generated/csv_export/provider/csv_export_provider.g.dart';

@riverpod
class CsvExportNotifier extends _$CsvExportNotifier {
  final List<List<dynamic>> _caseDataAoa = <List<dynamic>>[];
  final Map<String, String> _header = <String, String>{};

  @override
  StateOf<void> build() {
    return const StateOf<void>.init();
  }

  Future<void> shareExportedCsvFile() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    try {
      final filePath = await getCsvFilePath();
      final result = await ref
          .read(dialogServiceProvider)
          .shareFile([filePath], 'Mycaselog data as csv'.hardcoded);

      result.when(
        failure: (l) {
          errorTracker.log(l);
          state = StateOf<void>.failure(AppException.fromError(l));
        },
        success: (r) =>
            Future<void>.delayed(const Duration(milliseconds: 500)).then(
          (value) => state = const StateOf<void>.success(null),
        ),
      );
    } catch (err) {
      state = const StateOf<void>.failure(AppException.fileNotFound());
    }
  }

  Future<void> createCsvExportFile() async {
    try {
      state = const StateOf<void>.loading();
      await _createCsvData();
    } catch (err) {
      logger.error(err.toString());
      state = StateOf<void>.failure(AppException.generic(err.toString()));
    }
  }

  ///
  /// get the file path of the csv file
  ///
  Future<String> getCsvFilePath() async {
    final directoryPath = ref.watch(appDirPathProvider);
    final userID = ref.read(userIDProvider);
    final fileName = 'mycaselog_cases_data_$userID.csv';

    return '$directoryPath/$fileName';
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Local emthods
  /// ////////////////////////////////////////////////////////////////////
  Future<void> _createCsvData() async {
    final values = <Map<String, dynamic>>[];

    final caseModels = ref.watch(collectionsProvider).casesCollection.getAll();

    await Future<void>.delayed(const Duration(milliseconds: 1000));

    for (final caseModel in caseModels) {
      //get fields data from case data
      final fieldsData = <String, dynamic>{};
      final caseModelUnmanaged = caseModel.toUnmanaged();

      for (final templateField in caseModelUnmanaged.fieldsData) {
        if (templateField.title != null) {
          fieldsData[templateField.title!] = templateField.value;
        }
      }
      // /// clear original fields Data in  the model to reduce memory foot print
      caseModelUnmanaged.fieldsData.clear();

      /// create a joint map of basic data and fields data
      final jointMap = <String, dynamic>{}
        ..addAll(caseModelUnmanaged.toJson())
        ..addAll(fieldsData) //<-- new fields data
        ..remove('fieldsData') //<-- remove original fields data
        ..remove('patientModel')
        ..remove('pcpModel');

      // ignore: cascade_invocations
      jointMap.forEach((k, v) {
        _header.putIfAbsent(k, () => 'unknown');
      });

      values.add(jointMap);
    }

    await _iterateCsvData(values, 0);
  }

  Future<void> _iterateCsvData(List<Map<String, dynamic>> data, int idx) async {
    try {
      if (idx < data.length) {
        final group = data[idx];

        final caseItems = <dynamic>[];
        _header.keys.map((key) => caseItems.add(group[key] ?? '')).toList();

        _caseDataAoa.add(caseItems);
        await _iterateCsvData(data, idx + 1);
      } else {
        _caseDataAoa.insert(0, _header.keys.toList());
        final res = const ListToCsvConverter()
            .convert(_caseDataAoa, fieldDelimiter: ';');

        final csvFilePath = await getCsvFilePath();

        //write the daata to the file and call success
        await File(csvFilePath).writeAsString(res);
        state = const StateOf<void>.success(null);
      }
    } catch (err) {
      state = StateOf<void>.failure(AppException.fromError(err));
    }
  }
}
