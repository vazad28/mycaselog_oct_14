part of './collections.dart';

/// Media data collection
class MediaCollection extends RealmCollection<MediaModel>
    with RefreshBacklinksMixin {
  MediaCollection(super.realmDatabase);

  @override
  String get path => '$root/$userID/${DbCollection.media.name}';

  @override
  Future<void> add(MediaModel model) {
    return realm.writeAsync(() {
      realm.add<MediaModel>(model, update: true);

      /// Update case object if needed
      final caseModel = realm.find<CaseModel>(model.caseID);
      if (caseModel != null && !caseModel.medias.contains(model)) {
        caseModel.medias.add(model);
      }
    });
  }

  @override
  String getPrimaryKey(MediaModel model) {
    // TODO: implement getPrimaryKey
    throw UnimplementedError();
  }

  @override
  MediaModel mapToModel(Map<String, dynamic> json) {
    // TODO: implement mapToModel
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> modelToMap(MediaModel model) {
    // TODO: implement modelToMap
    throw UnimplementedError();
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Custom Methods
  /// ////////////////////////////////////////////////////////////////////
  /// Retrieves media items associated with a specific case ID from Realm.
  RealmResults<MediaModel> getCaseMedia(String caseID) {
    return realm
        .query<MediaModel>(r'caseID == $0 AND removed == $1', [caseID, 0]);
  }

  /// Retrieves a list of MediaModel objects based on their case IDs.
  RealmResults<MediaModel> getAllByMediaIDs(List<String> mediaIDs) {
    return realm.query<MediaModel>(r'mediaID IN $0', [mediaIDs]);
  }

  /// Searches for media items based on a list of IDs in Realm.
  RealmResults<MediaModel> search(Iterable<String> ids) {
    return realm.query<MediaModel>(r'caseID IN $0 AND removed == $1', [ids, 0]);
  }

  /// Updates the timestamp for a list of media items in Realm and Firestore.
  Future<void> changeTimelineMediaTimestamp(
    List<MediaModel> mediaList,
    int timestamp,
  ) async {
    return realm.writeAsync(() {
      final updatedMediaList = mediaList
        ..map((e) => e.timestamp = timestamp).toList();

      realm.addAll<MediaModel>(updatedMediaList, update: true);
    });
  }

  /// Refreshes media backlinks
  void refreshBacklinks() => refreshMediaBacklinks(realm, null);
}
