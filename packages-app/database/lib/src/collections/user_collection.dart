part of './collections.dart';

/// User data collection
class UserCollection extends RealmCollection<UserModel>
    with RefreshBacklinksMixin {
  UserCollection(super.realmDatabase) {
    final userModel = getSingle(userID);
    // must load user model data from server to prevent empty write
    if (userModel?.timestamp == 0) syncByTimestamp(timestamp: 0);
  }

  /// Firestore Methods
  @override
  String get path => 'users/$userID/data';

  @override
  Future<void> add(UserModel model) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  String getPrimaryKey(UserModel model) {
    // TODO: implement getPrimaryKey
    throw UnimplementedError();
  }

  @override
  UserModel mapToModel(Map<String, dynamic> json) {
    // TODO: implement mapToModel
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> modelToMap(UserModel model) {
    // TODO: implement modelToMap
    throw UnimplementedError();
  }

  UserModel userModelFromUser(AuthenticationUser user) {
    return UserModelX.fromUser(
      userID: user.id,
      email: user.email,
      displayName: user.name,
      photoUrl: user.photo,
    );
  }
}
