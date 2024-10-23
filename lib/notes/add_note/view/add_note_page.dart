import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_to_pdf/flutter_quill_to_pdf.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:models/models.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

import '../../../shared/shared.dart';
import '../provider/add_note_provider.dart';
import '../quill/fonts_loader.dart';
import '../quill/note_quill_editor.dart';
import '../widget/quill_toolbar_bottom.dart';

part '../widget/note_app_bar.dart';
part './add_note_form.dart';
part './add_note_view.dart';

final FontsLoader loader = FontsLoader();

class AddNotePage extends ConsumerStatefulWidget {
  const AddNotePage({
    required this.noteID,
    this.newRecord = false,
    super.key,
  });

  final String noteID;
  final bool newRecord;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddNotePageState();
}

class _AddNotePageState extends ConsumerState<AddNotePage>
    with AddNoteFormMixin {
  //final _controller = QuillController.basic();
  final _editorFocusNode = FocusNode();
  final _editorScrollController = ScrollController();

  final PDFPageFormat params = PDFPageFormat.letter;

  bool _editorHasFocus = false;

  late final Widget _noteEditor;

  @override
  void initState() {
    super.initState();

    _noteEditor = NoteQuillEditor(
      controller: ref.read(noteControllerProvider),
      configurations: const QuillEditorConfigurations(),
      scrollController: _editorScrollController,
      focusNode: _editorFocusNode,
    );

    _editorFocusNode.addListener(() {
      if (_editorHasFocus != _editorFocusNode.hasFocus) {
        setState(() {
          _editorHasFocus = !_editorHasFocus;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      seedForm(ref, widget.noteID);
    });
  }

  @override
  void dispose() {
    _editorFocusNode.dispose();
    _editorScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<StateOf<NoteModel>>(addNoteNotifierProvider, (_, state) {
      if (state.isSuccess) {
        Navigator.of(context).pop(state.data?.noteID);
        return;
      }
      if (state.isFailure) {
        context.showSnackBar(state.failure.toString());
        return;
      }
    });

    final scaffold = Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        bottomSheet: AnimatedContainer(
          height: _editorHasFocus ? kMinInteractiveDimension : 0,
          duration: Durations.medium4,
          child: QuillToolbarBottom(
            controller: ref.watch(noteControllerProvider),
          ),
        ),
        body: AddNoteView(noteEditor: _noteEditor));

    return FormPopScopeWrapper(
      key: const Key('__add_note_page_form_pop_scope_wrapper_key__'),
      canPop: () => canPop(ref),
      visibilitySwitcher: (visibility) {
        switchNavBarVisibility(ref, visibility: visibility);
      },
      routeObserver: pageRouteObserver(ref),
      child: scaffold,
    );
  }
}
