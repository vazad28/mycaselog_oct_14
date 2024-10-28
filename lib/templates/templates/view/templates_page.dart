import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:ui/ui.dart';

import '../../../router/router.dart';
import '../templates.dart';

class TemplatesPage extends ConsumerStatefulWidget {
  const TemplatesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TemplatesPageState();
}

class _TemplatesPageState extends ConsumerState<TemplatesPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).templates),
        bottom: const TemplatesBottomAppBar(),
      ),
      body: AsyncValueWidget(
        value: ref.watch(templatesNotifierProvider),
        data: (templateModels) {
          return ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: templateModels.length,
            itemBuilder: (_, index) => TemplatesListTile(
              templateModel: templateModels.elementAt(index),
            ).paddingOnly(bottom: AppSpacing.md),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ScrollReactiveFabButton(
        _scrollController,
        key: const Key('__add_template_fab_button_key__'),
        title: S.of(context).addTemplate.titleCase,
        onTap: () => context.openModalBottomSheet<void>(
          builder: (ctx) => TemplatesBottomSheetWidget(
            addNewTemplate: () {
              AddTemplateRoute(AddTemplateRoute.newItemParam)
                  .push<void>(context);
            },
            addSharedTemplate: () {
              _showSpecialitySelectionSheet(context).then((speciality) {
                if (speciality != null && context.mounted) {
                  //SharedTemplatesRoute(speciality).push<void>(context);
                }
              });
            },
          ),
        ),
      ),
    );
  }

  Future<String?> _showSpecialitySelectionSheet(BuildContext context) {
    return showModalBottomSheet<String?>(
      context: context,
      isScrollControlled: true, // set this to true
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.9,
          builder: (_, controller) {
            return SafeArea(
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: Theme.of(context).colorScheme.surface,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSpacing.md),
                    topRight: Radius.circular(AppSpacing.md),
                  ),
                ),
                child: TemplatesSpecialityList(controller: controller),
              ),
            );
          },
        );
      },
    );
  }
}
