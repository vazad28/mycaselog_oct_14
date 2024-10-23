part of './add_template_page.dart';

class AddTemplateForm extends ConsumerWidget with AddTemplateFormMixin {
  const AddTemplateForm({
    required this.templateModel,
    super.key,
  });

  final TemplateModel? templateModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formGroup = getFormGroup(ref);

    return ReactiveForm(
      key: ValueKey('__${templateModel ?? "add_template_form_key"}__'),
      formGroup: formGroup,
      child: Column(
        children: [
          const VerticalSpacer.normal(),

          /// template title
          ReactiveTextField<String>(
            formControlName: TemplateModelProps.title.name,
            decoration: InputDecoration(
                labelText: TemplateModelProps.title.name.titleCase,
                hintText: 'Title of template'),
            onTapOutside: (_) => primaryFocus?.unfocus(),
          ).formFieldPadding(),

          /// template description
          ReactiveTextField<String>(
            formControlName: TemplateModelProps.desc.name,
            decoration: InputDecoration(
                labelText: TemplateModelProps.desc.name.titleCase,
                hintText: 'Details of template'),
            onTapOutside: (_) => primaryFocus?.unfocus(),
          ).formFieldPadding(),

          /// Spacer
          const VerticalSpacer.normal(),
        ],
      ),
    );
  }
}
