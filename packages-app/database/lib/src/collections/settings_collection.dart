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
  String getPrimaryKey(SettingsModel model) => model.userID;

  @override
  SettingsModel mapToModel(Map<String, dynamic> json) =>
      SettingsModelX.fromJson(json);

  @override
  Map<String, dynamic> modelToMap(SettingsModel model) => model.toJson();
}
