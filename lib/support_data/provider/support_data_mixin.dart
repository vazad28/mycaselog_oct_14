part of './support_data_provider.dart';

mixin SupportDataMixin {
  List<ActivableCaseField> watchActiveFieldsList(WidgetRef ref) {
    return ref.watch(
      supportDataNotifierProvider.select((supportData) {
        if (supportData.activeBasicFields.isEmpty) {
          return ActivableCaseField.values;
        }

        return supportData.activeBasicFields
            .map((name) => ActivableCaseField.values.byName(name))
            .toList();
      }),
    );
  }

  List<String> watchAnesthesiaBlocks(WidgetRef ref) => ref.watch(
        supportDataNotifierProvider.select(
          (supportData) => supportData.anesthesiaBlocks,
        ),
      );
}
