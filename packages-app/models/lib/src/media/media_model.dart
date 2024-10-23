import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

import '../../models.dart';

//import '../../models.dart';

part 'media_model.realm.dart';
part 'media_model.g.dart';

///Media status
enum MediaStatus {
  cancelled,
  failed,
  processing,
  queued,
  removed,
  success,
  uploading,
}

@RealmModel()
@JsonSerializable(explicitToJson: true)
class $MediaModel {
  @PrimaryKey()
  late String mediaID;
  late String authorID;
  String caseID = 'unknown';
  late String? fileType;
  late String? fileName;
  late String? fileUri;
  late String? mediumUri;
  late String? thumbUri;

  @MapTo('status')
  late String? _status;
  @Ignored()
  MediaStatus get status {
    return MediaStatus.values.byName(_status ?? MediaStatus.queued.name);
  }

  @Ignored()
  set status(MediaStatus value) => _status = value.name;

  @Indexed(RealmIndexType.fullText)
  late String? comment;
  @Indexed()
  int removed = 0;
  int createdAt = 0;
  int timestamp = 0;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @Backlink(#medias)
  late Iterable<$CaseModel> linkedCaseModel;

  MediaModel toUnmanaged() {
    return MediaModel(
      mediaID,
      authorID,
      fileType: fileType,
      fileName: fileName,
      fileUri: fileUri,
      mediumUri: mediumUri,
      thumbUri: thumbUri,
      caseID: caseID,
      status: _status,
      comment: comment,
      removed: removed,
      createdAt: createdAt,
      timestamp: timestamp,
    );
  }

  Map<String, dynamic> toJson() => _$$MediaModelToJson(this);
}

extension MediaModelX on MediaModel {
  static MediaModel fromJson(Map<String, dynamic> json) =>
      _$$MediaModelFromJson(json).toUnmanaged();

  static MediaModel zero(String authorID) {
    final timestamp = ModelUtils.getTimestamp;

    final mediaModel = MediaModel(
      ModelUtils.uniqueID,
      authorID,
      createdAt: timestamp,
      timestamp: timestamp,
    );

    return mediaModel;
  }
}
