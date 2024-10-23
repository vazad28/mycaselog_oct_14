import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_logger_plus/flutter_logger_plus.dart';
// ignore: prefer_relative_imports
import 'package:models/models.dart';

import '../media_uploader.dart';

class MediaUploadOverlayWidget extends StatelessWidget {
  const MediaUploadOverlayWidget({
    required this.mediaModel,
    required this.uploadController,
    this.width,
    super.key,
  });

  final MediaModel mediaModel;
  final double? width;

  final UploadController? uploadController;

  @override
  Widget build(BuildContext context) {
    if (uploadController == null) return const SizedBox.shrink();

    return SizedBox(
      width: width ?? 96,
      child: _MediaUploadOverlayWidget(
        uploadController: uploadController!,
      ),
    );
  }
}

class _MediaUploadOverlayWidget extends StatelessWidget {
  const _MediaUploadOverlayWidget({
    required this.uploadController,
  });

  final UploadController uploadController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: uploadController,
      builder: (context, child) {
        final status = uploadController.uploadStatus;
        if (status == UploadStatus.success) {
          return const SizedBox.shrink();
        }

        if (status == UploadStatus.failed) {
          _onFailure(context);
        }

        logger.info(
          'uploadController.uploadProgress = ${uploadController.uploadProgress}',
        );

        return UploadOverlay(
          uploadStatus: status,
          uploadProgress: uploadController.uploadProgress,
          onRetry: uploadController.retryUpload,
          onCancel: uploadController.cancelUpload,
        );
      },
    );
  }

  void _onFailure(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Media upload failed'),
          ),
        );
      }
    });
  }
}
