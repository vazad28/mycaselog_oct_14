import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:recase/recase.dart';
import 'package:ui/ui.dart';

class TemplatesSpecialityList extends StatelessWidget {
  const TemplatesSpecialityList({this.controller, super.key});

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final specialitiesMap = SurgicalSpeciality.values.asNameMap();

    final child = Column(
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
            child: Text(
              S.of(context).selectASpeciality,
              style: context.textTheme.titleLarge,
            ),
          ),
        ),
        const Divider(),
        Expanded(
          child: ListView.separated(
            controller: controller,
            itemBuilder: (context, index) {
              final e = specialitiesMap.entries.elementAt(index);
              return ListTile(
                title: Text(e.value.name.titleCase),
                onTap: () {
                  Navigator.of(context).pop(e.key);
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(
              height: 1,
              indent: 16,
            ),
            itemCount: specialitiesMap.length,
          ),
        ),
      ],
    );

    return child;
  }
}
