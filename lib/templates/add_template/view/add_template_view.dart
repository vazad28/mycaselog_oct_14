part of './add_template_page.dart';

class AddTemplateView extends ConsumerWidget with AddTemplateFormMixin {
  const AddTemplateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isFormSeeded(ref)
        ? Column(
            children: [
              AddTemplateForm(
                templateModel: ref.watch(addTemplateSeederProvider),
              ),
              const Expanded(
                child: Column(
                  children: [
                    /// Controller bar for template fields
                    AddFieldBar(),

                    /// fields list
                    Expanded(
                      child: AddTemplateFieldList(),
                    ),
                  ],
                ),
              ),
            ],
          )
        : const Loading();
  }
}
