part of 'add_template_provider.dart';

mixin AddTemplateFormMixin {
  void seedForm(
    WidgetRef ref,
    String templateID,
    String userSpeciality,
  ) =>
      ref
          .watch(addTemplateSeederProvider.notifier)
          .seed(templateID, userSpeciality);

  bool isFormSeeded(WidgetRef ref) =>
      ref.watch(addTemplateSeederProvider) != null;

  StateOf<TemplateModel> formSubmitStatus(WidgetRef ref) =>
      ref.watch(addTemplateNotifierProvider);

  FormGroup getFormGroup(WidgetRef ref) =>
      ref.watch(addTemplateFormGroupProvider);

  Future<void> submitForm(WidgetRef ref) =>
      ref.watch(addTemplateNotifierProvider.notifier).submitForm();

  bool canPop(WidgetRef ref) =>
      ref.watch(addTemplateNotifierProvider.notifier).canPop();

  void switchNavBarVisibility(WidgetRef ref, {required bool visibility}) =>
      ref.watch(bottomNavVisibilityProvider.notifier).update(value: visibility);

  RouteObserver<ModalRoute<void>> pageRouteObserver(WidgetRef ref) =>
      ref.read(shellRoutesObserversProvider).settingsRouteObserver;
}
