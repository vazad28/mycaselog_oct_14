import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

import '../../models.dart';

part 'note_model.realm.dart';
part 'note_model.g.dart';

enum NoteModelProps {
  title,
  note,
}

@RealmModel()
@JsonSerializable(explicitToJson: true)
class _NoteModel {
  @PrimaryKey()
  late String noteID;
  late String? authorID;
  late String? title;
  late String? note;
  late int removed = 0;
  late int createdAt = 0;
  late int timestamp = 0;

  NoteModel toUnmanaged() {
    return NoteModel(
      noteID,
      authorID: authorID,
      title: title,
      note: note,
      removed: removed,
      createdAt: createdAt,
      timestamp: timestamp,
    );
  }
}

extension NoteModelX on NoteModel {
  quill.Document get quillDocument {
    if (note?.isEmpty ?? true) return quill.Document();

    final json = jsonDecode(note!) as List<dynamic>;
    return quill.Document.fromJson(json);
  }

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);

  static NoteModel fromJson(Map<String, dynamic> json) {
    return _$NoteModelFromJson(json).toUnmanaged();
  }

  static NoteModel zero() {
    final timestamp = ModelUtils.getTimestamp;
    return NoteModel(
      ModelUtils.uniqueID,
      createdAt: timestamp,
      timestamp: timestamp,
    );
  }
}

extension QuillDocumentNoteExt on quill.Document {
  String? get toJsonString {
    // for form can pop as the empty document.delta is not null
    if (isEmpty()) return null;
    // if not empty
    return json.encode(toDelta().toJson());
  }
}
