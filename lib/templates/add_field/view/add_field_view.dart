part of 'add_field_page.dart';

class AddFieldView extends ConsumerWidget with AddFieldFormMixin {
  const AddFieldView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isFormSeeded(ref) ? const AddFieldForm() : const Loading();
  }
}
