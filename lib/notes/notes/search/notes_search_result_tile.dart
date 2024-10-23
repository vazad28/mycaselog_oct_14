import 'package:animations/animations.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';

class NotesSearchResultTile extends StatelessWidget {
  const NotesSearchResultTile({
    required this.noteModel,
    super.key,
  });
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<void>(
      transitionType: ContainerTransitionType.fadeThrough,
      closedColor: context.colorScheme.surface,
      openColor: context.colorScheme.surface,
      closedElevation: 0,
      openBuilder: (context, action) {
        return const Placeholder();
        //return AddNotePage(noteID: noteModel.noteID);
      },
      //tappable: true,
      closedBuilder: (context, action) {
        return _NoteSearchTile(
          noteModel: noteModel,
        );
      },
    );
  }
}

class _NoteSearchTile extends StatelessWidget {
  const _NoteSearchTile({
    required this.noteModel,
  });
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return MaterialCard.bordered(
      padding: const EdgeInsets.all(AppSpacing.md),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: avoid_redundant_argument_values
        mainAxisAlignment: MainAxisAlignment.start, //<- need this explict here
        children: [
          if (noteModel.title?.isNotEmpty ?? false)
            Text(
              noteModel.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          const SizedBox(
            height: AppSpacing.sm,
          ),
          Text(
            noteModel.quillDocument.toPlainText(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium?.lighter(),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            noteModel.timestamp.formatMDY(),
            style: context.textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
