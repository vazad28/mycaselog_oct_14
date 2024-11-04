part of './collections.dart';

/// TimelineNotes data collection
class TimelineNotesCollection extends RealmCollection<TimelineNoteModel>
    with RefreshBacklinksMixin {
  TimelineNotesCollection(super.realmDatabase);

  @override
  String get path => '$root/$userID/${DbCollection.timelineNotes.name}';

  @override
  Future<void> add(TimelineNoteModel model) {
    return realm.writeAsync(() {
      model.timestamp = ModelUtils.getTimestamp;
      realm.add<TimelineNoteModel>(model, update: true);

      /// add timeline note to cases collection if not exist
      final caseModel = realm.find<CaseModel>(model.caseID);
      if (caseModel != null && !caseModel.notes.contains(model)) {
        caseModel.notes.add(model);
      }
    });
  }

  @override
  String getPrimaryKey(TimelineNoteModel model) => model.noteID;

  @override
  TimelineNoteModel mapToModel(Map<String, dynamic> json) =>
      TimelineNoteModelX.fromJson(json);

  @override
  Map<String, dynamic> modelToMap(TimelineNoteModel model) => model.toJson();

  /// ////////////////////////////////////////////////////////////////////
  /// Custom Methods
  /// ////////////////////////////////////////////////////////////////////

  /// Refresh timeline backlinks to cases collection  as needed
  void refreshBacklinks() => refreshTimelineNotesBacklinks(realm, null);

  /// Retrieves a list of MediaModel objects based on their case IDs.
  List<TimelineNoteModel> getAllByTimelineNoteIDs(
    List<String> timelineNoteIDs,
  ) {
    return realm
        .query<TimelineNoteModel>(r'noteID IN $0', [timelineNoteIDs]).toList();
  }

  /// Get notes for a case
  RealmResults<TimelineNoteModel> getCaseNotes(String caseID) {
    return realm
        .all<TimelineNoteModel>()
        .query(r'caseID == $0 AND removed == $1', [caseID, 0]);
  }

  Future<void> changeTimelineNotesTimestamp(
    List<TimelineNoteModel> noteList,
    int timestamp,
  ) {
    return realm.writeAsync(() {
      final updatedList = noteList
        ..map((e) => e.timestamp = timestamp).toList();

      realm.addAll<TimelineNoteModel>(updatedList, update: true);
    });
  }
}
