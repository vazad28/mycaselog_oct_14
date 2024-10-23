// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_model_equatable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateModelEquatable _$TemplateModelEquatableFromJson(
        Map<String, dynamic> json) =>
    TemplateModelEquatable(
      templateID: json['templateID'] as String,
      speciality: json['speciality'] as String? ?? 'no_speciality',
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      type: json['type'] as String? ?? 'surgery',
      fields: (json['fields'] as List<dynamic>?)
              ?.map((e) => TemplateFieldModelEquatable.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      shared: json['shared'] as bool? ?? false,
      createdAt: (json['createdAt'] as num?)?.toInt(),
      timestamp: (json['timestamp'] as num?)?.toInt(),
      removed: (json['removed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TemplateModelEquatableToJson(
        TemplateModelEquatable instance) =>
    <String, dynamic>{
      'templateID': instance.templateID,
      'speciality': instance.speciality,
      'title': instance.title,
      'desc': instance.desc,
      'type': instance.type,
      'fields': instance.fields,
      'shared': instance.shared,
      'createdAt': instance.createdAt,
      'timestamp': instance.timestamp,
      'removed': instance.removed,
    };
