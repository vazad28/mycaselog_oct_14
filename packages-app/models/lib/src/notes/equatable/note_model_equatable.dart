import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_model_equatable.g.dart';

@JsonSerializable(explicitToJson: true)
class NoteModelEquatable extends Equatable {

  const NoteModelEquatable({
    required this.noteID,
    this.authorID,
    this.title,
    this.note,
    this.removed = 0,
    this.createdAt = 0,
    this.timestamp = 0,
  });

  factory NoteModelEquatable.fromJson(Map<String, dynamic> json) {
    return _$NoteModelEquatableFromJson(json);
  }
  final String noteID;
  final String? authorID;
  final String? title;
  final String? note;
  final int removed;
  final int createdAt;
  final int timestamp;

  @override
  List<Object?> get props => [
        noteID,
        authorID,
        title,
        note,
        removed,
        createdAt,
        timestamp,
      ];
}
