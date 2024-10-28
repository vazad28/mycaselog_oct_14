part of 'add_case_provider.dart';

mixin AddCaseFormMixin {
  void seedForm(WidgetRef ref, String caseID) =>
      ref.watch(addCaseSeederProvider.notifier).seed(caseID);

  //bool isFormSeeded(WidgetRef ref) => ref.watch(addCaseSeederProvider) != null;

  StateOf<CaseModel> formSubmitStatus(WidgetRef ref) =>
      ref.watch(addCaseNotifierProvider);

  Future<void> submitForm(WidgetRef ref) =>
      ref.watch(addCaseNotifierProvider.notifier).submitForm();

  bool canPop(WidgetRef ref) =>
      ref.watch(addCaseNotifierProvider.notifier).canPop();

  void switchNavBarVisibility(WidgetRef ref, {required bool visibility}) =>
      ref.watch(bottomNavVisibilityProvider.notifier).update(value: visibility);

  RouteObserver<ModalRoute<void>> pageRouteObserver(WidgetRef ref) =>
      ref.read(shellRoutesObserversProvider).settingsRouteObserver;
}
