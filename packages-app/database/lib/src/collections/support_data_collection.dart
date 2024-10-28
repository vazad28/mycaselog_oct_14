part of './collections.dart';

/// SupportDatas data collection
class SupportDataCollection extends RealmCollection<SupportDataModel>
    with RefreshBacklinksMixin {
  SupportDataCollection(super.realmDatabase) {
    final supportData = getSingle(userID);
    // must load support data from server to prevent empty write
    if (supportData?.timestamp == 0) syncByTimestamp(timestamp: 0);
  }

  @override
  String get path => '$root/$userID/${DbCollection.supportData.name}';

  @override
  Future<void> add(SupportDataModel model) {
    return realm.writeAsync(() {
      realm.add<SupportDataModel>(model, update: true);
    });
  }

  @override
  String getPrimaryKey(SupportDataModel model) => model.userID;

  @override
  SupportDataModel mapToModel(Map<String, dynamic> json) =>
      SupportDataModelX.fromJson(json);

  @override
  Map<String, dynamic> modelToMap(SupportDataModel model) => model.toJson();

  /// Speciality function for CRUD action of support data model embedded objects
  Future<void> crud<S extends RealmObject>(S model, CrudAction action) {
    return realm.writeAsync(() {
      if (action == CrudAction.delete) {
        realm.delete<S>(model);
      } else {
        realm.add<S>(model, update: true);
      }
    });
  }

  SupportDataModel? getSupportData() => getSingle(userID);
}
