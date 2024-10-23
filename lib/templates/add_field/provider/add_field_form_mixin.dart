part of 'add_field_provider.dart';

mixin AddFieldFormMixin {
  void seedForm(WidgetRef ref, TemplateFieldModel templateFieldModel) =>
      ref.watch(addFieldSeederProvider.notifier).seed(templateFieldModel);

  bool isFormSeeded(WidgetRef ref) => ref.watch(addFieldSeederProvider) != null;

  StateOf<TemplateFieldModel> formSubmitStatus(WidgetRef ref) =>
      ref.watch(addFieldNotifierProvider);

  FormGroup getFormGroup(WidgetRef ref) => ref.watch(addFieldFormGroupProvider);

  Future<void> submitForm(WidgetRef ref) =>
      ref.watch(addFieldNotifierProvider.notifier).submitForm();

  bool canPop(WidgetRef ref) =>
      ref.watch(addFieldNotifierProvider.notifier).canPop();

  void switchNavBarVisibility(WidgetRef ref, {required bool visibility}) =>
      ref.watch(bottomNavVisibilityProvider.notifier).update(value: visibility);

  RouteObserver<ModalRoute<void>> pageRouteObserver(WidgetRef ref) =>
      ref.read(shellRoutesObserversProvider).settingsRouteObserver;
}
