import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../models.dart';

part 'template_model_equatable.g.dart';

@JsonSerializable(explicitToJson: false)
class TemplateModelEquatable extends Equatable {
  const TemplateModelEquatable({
    required this.templateID,
    this.speciality = 'no_speciality',
    this.title,
    this.desc,
    this.type = 'surgery',
    this.fields = const [],
    this.shared = false,
    this.createdAt,
    this.timestamp,
    this.removed,
  });

  factory TemplateModelEquatable.fromJson(Map<String, dynamic> json) {
    return _$TemplateModelEquatableFromJson(json);
  }

  final String templateID;
  final String speciality;
  final String? title;
  final String? desc;
  final String type;
  final List<TemplateFieldModelEquatable> fields;
  final bool shared;
  final int? createdAt;
  final int? timestamp;
  final int? removed;

  @override
  List<Object?> get props => [
        templateID,
        speciality,
        title,
        desc,
        type,
        fields,
        shared,
        createdAt,
        timestamp,
        removed,
      ];
}
