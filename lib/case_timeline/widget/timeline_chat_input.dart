import 'package:annotations/annotations.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:models/models.dart';

import '../../app/app.dart';
import '../case_timeline.dart';

class TimelineChatInput extends ConsumerWidget with TimelineMixin {
  const TimelineChatInput({
    required this.caseModel,
    super.key,
  });

  final CaseModel caseModel;

  String get todaysDate => DateTime.now().formatYMD();

  /// Widget builder method
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Widget cameraButton = IconButton(
      icon: const Icon(
        Icons.camera_alt,
      ),
      onPressed: () => _openAddMedia(ref, MediaType.image, ImageSource.camera),
    );

    final Widget galleryButton = IconButton(
      icon: const Icon(
        Icons.photo_library,
      ),
      onPressed: () => _openAddMedia(ref, MediaType.image, ImageSource.gallery),
    );

    return AppBar(
      primary: false,
      leading: IconButton(
        icon: const Icon(Icons.calendar_month),
        onPressed: () => _createTimelineItem(ref),
      ),
      title: GestureDetector(
        onTap: () => openTimelineNote(
          context,
          TimelineNoteModelX.zero(
            caseID: caseModel.caseID,
            authorID: ref.read(userIDProvider),
          ),
        ),
        child: Text(
          'add note..',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      actions: [cameraButton, galleryButton],
      elevation: 2,
    );
  }

  Future<void> _createTimelineItem(WidgetRef ref) async {
    final dateTimePicked = await ref.read(dialogServiceProvider).openDatePicker(
          initialDate: DateTime.now(),
        );
    if (dateTimePicked == null) return;
    final notifier =
        ref.watch(caseTimelineNotifierProvider(caseModel.caseID).notifier);
    //ignore: cascade_invocations
    notifier.createEmptyTimelineItem(caseModel, dateTimePicked);
  }

  void _openAddMedia(WidgetRef ref, MediaType image, ImageSource source) {
    addTimelinePhoto(
      ref,
      caseID: caseModel.caseID,
      source: source,
      timestamp: ModelUtils.getTimestamp,
    );
  }
}
