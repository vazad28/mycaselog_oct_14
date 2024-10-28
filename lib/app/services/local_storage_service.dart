part of 'services.dart';

/// Riverpod provider to use the dialog service
@riverpod
LocalStorage localStorage(LocalStorageRef ref) {
  final persistentStorage = ref.watch(persistentStorageProvider);

  return LocalStorage(persistentStorage: persistentStorage);
}

abstract class StorageKeys {
  static const lastSyncTime = '__last_sync_time__';
  static const lastSyncTimePrefix = '__last_sync_time_prefix__';
  static const lastFtsUpdateTime = '__last_fts_update_time__';
  static const themeSettings = '__theme_settings__';
  static const settings = '__app_settings__';
  static const caseTileNavigate = '__case_tile_navigate__';
  static const onboardedStatus = '__onboarded_tatus__';
  static const dbUpgradeVersion = '__db_upgrade_version__';
  static const caseListTileStyle = '__case_list_tile_style__';
  static const noteListTileStyle = '__note_list_tile_style__';
  static const mediaGridTileStyle = '__media_grid_tile_style__';
  static const defaultSurgeryLocation = '__default_surgery_location__';
  static const searchContentType = '__search_content_type__';
  static const importTemplateInfoReviewedStatus =
      '__user_has_reviewed_import_template_info__';
  static const notesRecentSearches = '__notes_recent_searches__';
  static const caseMediaRecentSearches = '__case_media_recent_searches__';
}

/// Local storage class using the _persistentStorage
class LocalStorage {
  LocalStorage({required PersistentStorage persistentStorage})
      : _persistentStorage = persistentStorage;

  final PersistentStorage _persistentStorage;

  /// clear local storage
  void clear() => _persistentStorage.clear();

  /// getter for an instance of sharedpreferences directly
  PersistentStorage get persistentStorage => _persistentStorage;

  /// //////////////////////////////////////////////////////////
  /// Methods for direct use
  /// //////////////////////////////////////////////////////////
  /// Sets the number of times the app was opened.
  void setImportTemplateInfoReviewed() => _persistentStorage.writeBool(
        StorageKeys.importTemplateInfoReviewedStatus,
        true,
      );

  /// Fetches the number of times the app was opened value from Storage.
  bool getImportTemplateInfoReviewed() {
    return _persistentStorage.readBool(
      StorageKeys.importTemplateInfoReviewedStatus,
      false,
    );
  }

  ///db upgrade required
  void setDbUpgradeVersion(int version) =>
      _persistentStorage.writeInt(StorageKeys.dbUpgradeVersion, version);

  int getDbUpgradeVersion() =>
      _persistentStorage.readInt(StorageKeys.dbUpgradeVersion, 1);

  /// default surgery location
  String get getDefaultSurgeryLocation =>
      _persistentStorage.readString(StorageKeys.defaultSurgeryLocation, '');

  void setDefaultSurgeryLocation(String value) =>
      _persistentStorage.writeString(StorageKeys.defaultSurgeryLocation, value);

  /// Cases tile styles
  int getCaseListTileStyle() =>
      _persistentStorage.readInt(StorageKeys.caseListTileStyle, 0);
  void setCaseListTileStyle(int value) =>
      _persistentStorage.writeInt(StorageKeys.caseListTileStyle, value);

  /// Media Tile style
  int getMediaGridTileStyle() =>
      _persistentStorage.readInt(StorageKeys.mediaGridTileStyle, 0);

  void setMediaGridTileStyle(int value) =>
      _persistentStorage.writeInt(StorageKeys.mediaGridTileStyle, value);

  /// Notes title style
  int get noteListTileStyle =>
      _persistentStorage.readInt(StorageKeys.noteListTileStyle, 0);
  void setNoteListTileStyle(int value) =>
      _persistentStorage.writeInt(StorageKeys.noteListTileStyle, value);

  /// tile styles
  int get caseTileNavigate =>
      _persistentStorage.readInt(StorageKeys.caseTileNavigate, 0);

  void setCaseTileNavigate(int value) =>
      _persistentStorage.writeInt(StorageKeys.caseTileNavigate, value);

  /// app settings
  void setSettings(Map<String, dynamic> value) {
    _persistentStorage.writeString(StorageKeys.settings, json.encode(value));
  }

  Map<String, dynamic>? getSettings() {
    final settingsString =
        _persistentStorage.readJson(StorageKeys.settings, {});

    if (settingsString.isNotEmpty) return settingsString;

    return null;
  }

  List<String> getNotesRecentSearches() {
    return _persistentStorage
        .readStringList(StorageKeys.notesRecentSearches, <String>[]);
  }

  void setNotesRecentSearches(List<String> notesRecentSearches) {
    _persistentStorage.writeStringList(
      StorageKeys.notesRecentSearches,
      notesRecentSearches,
    );
  }

  List<String> getCaseMediaRecentSearches() {
    return _persistentStorage
        .readStringList(StorageKeys.caseMediaRecentSearches, <String>[]);
  }

  void setCaseMediaRecentSearches(List<String> caseMediaRecentSearches) {
    _persistentStorage.writeStringList(
      StorageKeys.caseMediaRecentSearches,
      caseMediaRecentSearches,
    );
  }

  void setRecentSearches<T>(List<String> searchHistory) {}
}
