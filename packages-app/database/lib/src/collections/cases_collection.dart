part of './collections.dart';

/// Cases data collection
class CasesCollection extends RealmCollection<CaseModel>
    with RefreshBacklinksMixin {
  CasesCollection(super.realmDatabase);

  @override
  String get path => '$root/$userID/${DbCollection.cases.name}';

  @override
  String getPrimaryKey(CaseModel model) {
    return model.caseID;
  }

  @override
  CaseModel mapToModel(Map<String, dynamic> json) {
    return CaseModelX.fromJson(json);
  }

  @override
  Map<String, dynamic> modelToMap(CaseModel model) {
    return model.toJson();
  }

  @override
  Future<void> add(CaseModel model) async {
    return realm.writeAsync(() {
      model.timestamp = ModelUtils.getTimestamp;
      realm.add<CaseModel>(model, update: true);
    });
  }
}
