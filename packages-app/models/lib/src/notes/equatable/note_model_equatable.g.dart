// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model_equatable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteModelEquatable _$NoteModelEquatableFromJson(Map<String, dynamic> json) =>
    NoteModelEquatable(
      noteID: json['noteID'] as String,
      authorID: json['authorID'] as String?,
      title: json['title'] as String?,
      note: json['note'] as String?,
      removed: (json['removed'] as num?)?.toInt() ?? 0,
      createdAt: (json['createdAt'] as num?)?.toInt() ?? 0,
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$NoteModelEquatableToJson(NoteModelEquatable instance) =>
    <String, dynamic>{
      'noteID': instance.noteID,
      'authorID': instance.authorID,
      'title': instance.title,
      'note': instance.note,
      'removed': instance.removed,
      'createdAt': instance.createdAt,
      'timestamp': instance.timestamp,
    };
