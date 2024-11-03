part of './collections.dart';

/// Cases data collection
class TemplatesCollection extends RealmCollection<TemplateModel>
    with RefreshBacklinksMixin {
  TemplatesCollection(super.realmDatabase);

  @override
  String get path => '$root/$userID/${DbCollection.templates.name}';

  @override
  Future<void> add(TemplateModel model) {
    return realm.writeAsync(() {
      model.timestamp = ModelUtils.getTimestamp;
      realm.add<TemplateModel>(model, update: true);
    });
  }

  @override
  String getPrimaryKey(TemplateModel model) {
    return model.templateID;
  }

  @override
  TemplateModel mapToModel(Map<String, dynamic> json) {
    return TemplateModelX.fromJson(json);
  }

  @override
  Map<String, dynamic> modelToMap(TemplateModel model) {
    return model.toJson();
  }
}
