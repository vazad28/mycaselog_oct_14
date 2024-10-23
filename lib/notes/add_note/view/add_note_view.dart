part of 'add_note_page.dart';

class AddNoteView extends ConsumerWidget with AddNoteFormMixin {
  const AddNoteView({
    required this.noteEditor,
    super.key,
  });

  final Widget noteEditor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isFormSeeded(ref)
        ? AddNoteForm(
            noteModel: ref.watch(addNoteSeederProvider),
            noteEditor: noteEditor,
          )
        : const Loading();
  }
}
