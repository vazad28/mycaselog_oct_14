part of 'add_note_provider.dart';

mixin AddNoteFormMixin {
  void seedForm(WidgetRef ref, String noteID) =>
      ref.watch(addNoteSeederProvider.notifier).seed(noteID);

  bool isFormSeeded(WidgetRef ref) => ref.watch(addNoteSeederProvider) != null;

  StateOf<NoteModel> formSubmitStatus(WidgetRef ref) =>
      ref.watch(addNoteNotifierProvider);

  FormGroup getFormGroup(WidgetRef ref) => ref.watch(addNoteFormGroupProvider);

  Future<void> submitForm(WidgetRef ref) =>
      ref.watch(addNoteNotifierProvider.notifier).submitForm();

  bool canPop(WidgetRef ref) =>
      ref.watch(addNoteNotifierProvider.notifier).canPop();

  void switchNavBarVisibility(WidgetRef ref, {required bool visibility}) =>
      ref.watch(bottomNavVisibilityProvider.notifier).update(value: visibility);

  RouteObserver<ModalRoute<void>> pageRouteObserver(WidgetRef ref) =>
      ref.read(shellRoutesObserversProvider).notesRouteObserver;
}
