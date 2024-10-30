import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:models/models.dart';

import '../../media_gallery/media_gallery.dart';

class MediaListTile extends StatelessWidget {
  const MediaListTile({
    required this.caseModel,
    required this.mediaModel,
    super.key,
  });

  final CaseModel caseModel;
  final MediaModel mediaModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Thumbnail(
          mediaModel: mediaModel,
        ),
      ),
      title: Text(caseModel.diagnosis ?? S.of(context).noTitle),
      subtitle: Text(caseModel.surgery ?? S.of(context).noTitle),
    );
  }
}
