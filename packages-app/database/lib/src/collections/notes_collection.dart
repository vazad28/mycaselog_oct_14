part of './collections.dart';

/// Notes data collection
class NotesCollection extends RealmCollection<NoteModel>
    with RefreshBacklinksMixin {
  NotesCollection(super.realmDatabase);

  @override
  String get path => '$root/$userID/${DbCollection.notes.name}';

  @override
  Future<void> add(NoteModel model) {
    return realm.writeAsync(() {
      model.timestamp = ModelUtils.getTimestamp;
      realm.add<NoteModel>(model, update: true);
    });
  }

  @override
  String getPrimaryKey(NoteModel model) => model.noteID;

  @override
  NoteModel mapToModel(Map<String, dynamic> json) => NoteModelX.fromJson(json);

  @override
  Map<String, dynamic> modelToMap(NoteModel model) => model.toJson();

  ///  Delete note
  Future<void> deleteNote(NoteModel noteModel) {
    return upsert(() => noteModel..removed = 1);
  }

  /// Search in notes
  RealmResults<NoteModel> search(String searchTerm) {
    return realm.query<NoteModel>(
      r'title TEXT $0 OR note TEXT $0',
      ['$searchTerm*'],
    );
  }
}
