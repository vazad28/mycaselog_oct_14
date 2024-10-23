part of 'collections.dart';

class SettingsCollection extends RealmCollection<SettingsModel>
    with RefreshBacklinksMixin {
  SettingsCollection(super.realmDatabase);

  @override
  String get path => '$root/$userID/${DbCollection.settings.name}';

  @override
  Future<void> add(SettingsModel model) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  String getPrimaryKey(SettingsModel object) {
    // TODO: implement getPrimaryKey
    throw UnimplementedError();
  }

  @override
  SettingsModel mapToModel(Map<String, dynamic> data) {
    // TODO: implement mapToModel
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> modelToMap(SettingsModel object) {
    // TODO: implement modelToMap
    throw UnimplementedError();
  }
}
