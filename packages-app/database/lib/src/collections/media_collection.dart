part of './collections.dart';

/// Media data collection
class MediaCollection extends RealmCollection<MediaModel>
    with RefreshBacklinksMixin {
  MediaCollection(super.realmDatabase);

  @override
  String get path => '$root/$userID/${DbCollection.media.name}';

  @override
  Future<void> add(MediaModel model) {
    // TODO: implement add
    throw UnimplementedError();
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

  /// Searches for media items based on a list of IDs in Realm.
  RealmResults<MediaModel> search(Iterable<String> ids) {
    return realm.query<MediaModel>(r'caseID IN $0 AND removed == $1', [ids, 0]);
  }

  /// Refreshes media backlinks
  void refreshBacklinks() => refreshMediaBacklinks(realm, null);
}
