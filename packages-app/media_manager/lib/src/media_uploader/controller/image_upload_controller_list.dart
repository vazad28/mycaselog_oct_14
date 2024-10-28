import 'package:collection/collection.dart';
import 'package:flutter_logger_plus/flutter_logger_plus.dart';
import 'package:models/models.dart';

import '../../../media_manager.dart';

class ImageUploadControllersList {
  /// Consumable Constructor
  factory ImageUploadControllersList() {
    return _instance;
  }

  /// Internal Constructor
  ImageUploadControllersList._internal();

  /// Always return a singleton instance
  static final _instance = ImageUploadControllersList._internal();

  final Map<String, UploadController> _uploadList = {};

  Map<String, UploadController> get uploadList => _uploadList;

  void removeController(String mediaID) {
    _uploadList.remove(mediaID);
  }

  ImageUploadController addController(
    MediaModel mediaModel,
    MediaUploadService mediaUploadService,
  ) {
    final controller = ImageUploadController(
      mediaModel: mediaModel,
      mediaUploadService: mediaUploadService,
      onRemoveController: (String mediaID) {
        removeController(mediaID);
      },
    );

    _uploadList.putIfAbsent(mediaModel.mediaID, () => controller);

    logger.info('upload controller list ${_uploadList.length}');
    return controller;
  }

  UploadController? getUploadController(
    MediaModel mediaModel,
    MediaUploadService mediaUploadService,
  ) {
    if (mediaModel.status == MediaStatus.success ||
        mediaModel.status == MediaStatus.cancelled) {
      return null;
    }

    final entry = _uploadList.entries
        .firstWhereOrNull((element) => element.key == mediaModel.mediaID);

    return entry?.value ??
        addController(
          mediaModel,
          mediaUploadService,
        );
  }
}
