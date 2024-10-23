// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MediaModel extends $MediaModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  MediaModel(
    String mediaID,
    String authorID, {
    String caseID = 'unknown',
    String? fileType,
    String? fileName,
    String? fileUri,
    String? mediumUri,
    String? thumbUri,
    String? status,
    String? comment,
    int removed = 0,
    int createdAt = 0,
    int timestamp = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<MediaModel>({
        'caseID': 'unknown',
        'removed': 0,
        'createdAt': 0,
        'timestamp': 0,
      });
    }
    RealmObjectBase.set(this, 'mediaID', mediaID);
    RealmObjectBase.set(this, 'authorID', authorID);
    RealmObjectBase.set(this, 'caseID', caseID);
    RealmObjectBase.set(this, 'fileType', fileType);
    RealmObjectBase.set(this, 'fileName', fileName);
    RealmObjectBase.set(this, 'fileUri', fileUri);
    RealmObjectBase.set(this, 'mediumUri', mediumUri);
    RealmObjectBase.set(this, 'thumbUri', thumbUri);
    RealmObjectBase.set(this, 'status', status);
    RealmObjectBase.set(this, 'comment', comment);
    RealmObjectBase.set(this, 'removed', removed);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'timestamp', timestamp);
  }

  MediaModel._();

  @override
  String get mediaID => RealmObjectBase.get<String>(this, 'mediaID') as String;
  @override
  set mediaID(String value) => RealmObjectBase.set(this, 'mediaID', value);

  @override
  String get authorID =>
      RealmObjectBase.get<String>(this, 'authorID') as String;
  @override
  set authorID(String value) => RealmObjectBase.set(this, 'authorID', value);

  @override
  String get caseID => RealmObjectBase.get<String>(this, 'caseID') as String;
  @override
  set caseID(String value) => RealmObjectBase.set(this, 'caseID', value);

  @override
  String? get fileType =>
      RealmObjectBase.get<String>(this, 'fileType') as String?;
  @override
  set fileType(String? value) => RealmObjectBase.set(this, 'fileType', value);

  @override
  String? get fileName =>
      RealmObjectBase.get<String>(this, 'fileName') as String?;
  @override
  set fileName(String? value) => RealmObjectBase.set(this, 'fileName', value);

  @override
  String? get fileUri =>
      RealmObjectBase.get<String>(this, 'fileUri') as String?;
  @override
  set fileUri(String? value) => RealmObjectBase.set(this, 'fileUri', value);

  @override
  String? get mediumUri =>
      RealmObjectBase.get<String>(this, 'mediumUri') as String?;
  @override
  set mediumUri(String? value) => RealmObjectBase.set(this, 'mediumUri', value);

  @override
  String? get thumbUri =>
      RealmObjectBase.get<String>(this, 'thumbUri') as String?;
  @override
  set thumbUri(String? value) => RealmObjectBase.set(this, 'thumbUri', value);

  @override
  String? get _status => RealmObjectBase.get<String>(this, 'status') as String?;
  @override
  set _status(String? value) => RealmObjectBase.set(this, 'status', value);

  @override
  String? get comment =>
      RealmObjectBase.get<String>(this, 'comment') as String?;
  @override
  set comment(String? value) => RealmObjectBase.set(this, 'comment', value);

  @override
  int get removed => RealmObjectBase.get<int>(this, 'removed') as int;
  @override
  set removed(int value) => RealmObjectBase.set(this, 'removed', value);

  @override
  int get createdAt => RealmObjectBase.get<int>(this, 'createdAt') as int;
  @override
  set createdAt(int value) => RealmObjectBase.set(this, 'createdAt', value);

  @override
  int get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int;
  @override
  set timestamp(int value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  RealmResults<CaseModel> get linkedCaseModel {
    if (!isManaged) {
      throw RealmError('Using backlinks is only possible for managed objects.');
    }
    return RealmObjectBase.get<CaseModel>(this, 'linkedCaseModel')
        as RealmResults<CaseModel>;
  }

  @override
  set linkedCaseModel(covariant RealmResults<CaseModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<MediaModel>> get changes =>
      RealmObjectBase.getChanges<MediaModel>(this);

  @override
  Stream<RealmObjectChanges<MediaModel>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<MediaModel>(this, keyPaths);

  @override
  MediaModel freeze() => RealmObjectBase.freezeObject<MediaModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'mediaID': mediaID.toEJson(),
      'authorID': authorID.toEJson(),
      'caseID': caseID.toEJson(),
      'fileType': fileType.toEJson(),
      'fileName': fileName.toEJson(),
      'fileUri': fileUri.toEJson(),
      'mediumUri': mediumUri.toEJson(),
      'thumbUri': thumbUri.toEJson(),
      'status': _status.toEJson(),
      'comment': comment.toEJson(),
      'removed': removed.toEJson(),
      'createdAt': createdAt.toEJson(),
      'timestamp': timestamp.toEJson(),
    };
  }

  static EJsonValue _toEJson(MediaModel value) => value.toEJson();
  static MediaModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'mediaID': EJsonValue mediaID,
        'authorID': EJsonValue authorID,
      } =>
        MediaModel(
          fromEJson(mediaID),
          fromEJson(authorID),
          caseID: fromEJson(ejson['caseID'], defaultValue: 'unknown'),
          fileType: fromEJson(ejson['fileType']),
          fileName: fromEJson(ejson['fileName']),
          fileUri: fromEJson(ejson['fileUri']),
          mediumUri: fromEJson(ejson['mediumUri']),
          thumbUri: fromEJson(ejson['thumbUri']),
          status: fromEJson(ejson['status']),
          comment: fromEJson(ejson['comment']),
          removed: fromEJson(ejson['removed'], defaultValue: 0),
          createdAt: fromEJson(ejson['createdAt'], defaultValue: 0),
          timestamp: fromEJson(ejson['timestamp'], defaultValue: 0),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(MediaModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, MediaModel, 'MediaModel', [
      SchemaProperty('mediaID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('authorID', RealmPropertyType.string),
      SchemaProperty('caseID', RealmPropertyType.string),
      SchemaProperty('fileType', RealmPropertyType.string, optional: true),
      SchemaProperty('fileName', RealmPropertyType.string, optional: true),
      SchemaProperty('fileUri', RealmPropertyType.string, optional: true),
      SchemaProperty('mediumUri', RealmPropertyType.string, optional: true),
      SchemaProperty('thumbUri', RealmPropertyType.string, optional: true),
      SchemaProperty('_status', RealmPropertyType.string,
          mapTo: 'status', optional: true),
      SchemaProperty('comment', RealmPropertyType.string,
          optional: true, indexType: RealmIndexType.fullText),
      SchemaProperty('removed', RealmPropertyType.int,
          indexType: RealmIndexType.regular),
      SchemaProperty('createdAt', RealmPropertyType.int),
      SchemaProperty('timestamp', RealmPropertyType.int),
      SchemaProperty('linkedCaseModel', RealmPropertyType.linkingObjects,
          linkOriginProperty: 'medias',
          collectionType: RealmCollectionType.list,
          linkTarget: 'CaseModel'),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
