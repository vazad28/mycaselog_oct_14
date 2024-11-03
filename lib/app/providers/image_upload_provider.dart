part of 'providers.dart';

/// Riverpod provider to use the dialog service
@Riverpod(keepAlive: true)
ImageUploadService imageUploadService(Ref ref) {
  return ImageUploadService(ref);
}

/// provider class
class ImageUploadService implements MediaUploadService {
  ImageUploadService(this.ref);

  final Ref ref;

  @override
  bool get uploadFullSizePhoto =>
      ref.read(settingsNotifierProvider).uploadFullSizePhoto;

  @override
  Reference getMediumRef(MediaModel mediaModel) {
    return ref.watch(dbProvider).storageCollection.getMediumRef(mediaModel);
  }

  @override
  Reference getOriginalRef(MediaModel mediaModel) {
    return ref.watch(dbProvider).storageCollection.getOriginalRef(mediaModel);
  }

  @override
  Reference getThumbRef(MediaModel mediaModel) {
    return ref.watch(dbProvider).storageCollection.getThumbRef(mediaModel);
  }

  @override
  void onUploadFailure(
    MediaModel mediaModel,
    UploadStatus uploadStatus,
    String? message,
  ) {
    var mediaStatus = MediaStatus.failed;

    if (uploadStatus == UploadStatus.cancelled) {
      mediaStatus = MediaStatus.cancelled;
    }

    ref
        .watch(dbProvider)
        .mediaCollection
        .upsert(() => mediaModel..status = mediaStatus)
        .then((_) {
      ref.watch(dialogServiceProvider).showSnackBar(message);
    });
  }

  @override
  Future<void> onUploadSucces(
    MediaModel mediaModel, {
    String? thumbUri,
    String? mediumUri,
    String? fullUri,
  }) async {
    errorTracker.log('reached onUploadSucces $thumbUri');

    ///  update the database
    await ref.watch(dbProvider).mediaCollection.upsert(
          () => mediaModel
            ..fileUri = fullUri
            ..mediumUri = mediumUri
            ..thumbUri = thumbUri
            ..status = MediaStatus.success
            ..timestamp = ModelUtils.getTimestamp,
        );
  }
}
