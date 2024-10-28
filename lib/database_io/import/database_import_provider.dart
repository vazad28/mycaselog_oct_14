import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils/utils.dart';

import '../../app/app.dart';

part '../../generated/database_io/import/database_import_provider.g.dart';

@riverpod
class DatabaseImportNotifier extends _$DatabaseImportNotifier {
  late final String zipFilePath;

  @override
  StateOf<void> build() {
    return const StateOf<void>.init();
  }

  Future<void> deleteLocalDbExportFile() async {
    if (File(zipFilePath).existsSync()) File(zipFilePath).deleteSync();
  }

  Future<void> importLocalDbFile() async {
    try {
      final result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['zip']);

      if (result?.files.single.path == null) {
        state = const StateOf<void>.failure(AppException.fileNotFound());
      }

      /// read current databse file
      final dbFile =
          File(ref.watch(realmDatabaseProvider).requireValue.realm.config.path);

      /// if we have the db file warn user that this will be overwritten
      if (dbFile.existsSync()) {
        final res = await ref.watch(dialogServiceProvider).showConfirmDialog(
              'This action will over-write existing databse and is irreversible action. \nProceed?'
                  .hardcoded,
            );
        if (!res) return;
      }

      final file = await convertPlatformFileToFile(result!.files.single);

      await dbFile.writeAsBytes(file!.readAsBytesSync());

      state = const StateOf<void>.success(null);
    } catch (e) {
      state = StateOf<void>.failure(
        AppException.generic('Database file import failed'.hardcoded),
      );
    }
  }
}

Future<File?> convertPlatformFileToFile(PlatformFile? platformFile) async {
  if (platformFile == null) return null;

  // Ensure the platformFile has a valid path
  if (platformFile.path == null) {
    return null;
  }

  final file = File(platformFile.path!);

  // Check if the file exists
  if (!file.existsSync()) {
    return null;
  }

  return file;
}
