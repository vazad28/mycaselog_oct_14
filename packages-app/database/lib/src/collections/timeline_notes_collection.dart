part of './collections.dart';

/// TimelineNotes data collection
class TimelineNotesCollection extends RealmCollection<TimelineNoteModel>
    with RefreshBacklinksMixin {
  TimelineNotesCollection(super.realmDatabase);

  @override
  String get path => '$root/$userID/${DbCollection.timelineNotes.name}';

  @override
  Future<void> add(TimelineNoteModel model) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  String getPrimaryKey(TimelineNoteModel model) {
    // TODO: implement getPrimaryKey
    throw UnimplementedError();
  }

  @override
  TimelineNoteModel mapToModel(Map<String, dynamic> json) {
    // TODO: implement mapToModel
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> modelToMap(TimelineNoteModel model) {
    // TODO: implement modelToMap
    throw UnimplementedError();
  }
}
