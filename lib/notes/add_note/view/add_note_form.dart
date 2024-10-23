part of 'add_note_page.dart';

class AddNoteForm extends ConsumerWidget with AddNoteFormMixin {
  const AddNoteForm({
    required this.noteModel,
    required this.noteEditor,
    super.key,
  });

  final NoteModel? noteModel;
  final Widget noteEditor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formGroup = getFormGroup(ref);

    return ReactiveForm(
      key: ValueKey('__${noteModel ?? "add_note_form_key"}__'),
      formGroup: formGroup,
      child: Column(children: [
        const NoteAppBar(
          key: Key('__note_app_bar_key__'),
        ),
        const VerticalSpacer.normal(),

        /// template title
        ReactiveTextField<String>(
          formControlName: NoteModelProps.title.name,
          decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              label: Text('Title'),
              hintText: 'Title of your note',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding: EdgeInsets.all(4)),
          onTapOutside: (_) => primaryFocus?.unfocus(),
        ).formFieldPadding(),

        Builder(
          builder: (context) {
            return Expanded(
              child: ReactiveFormField<String?, String?>(
                formControlName: NoteModelProps.note.name,
                builder: (ReactiveFormFieldState<String?, String?> field) {
                  return noteEditor;
                },
              ),
            );
          },
        ),
      ]),
    );
  }
}
