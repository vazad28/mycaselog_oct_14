// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'template_field_model_equatable.g.dart';

// @JsonSerializable(explicitToJson: false)
// class TemplateFieldModelEquatable extends Equatable {
//   const TemplateFieldModelEquatable({
//     required this.fieldID,
//     this.title,
//     this.idx = 0,
//     this.isRequired = false,
//     this.options = const [],
//     this.defaultValue,
//     this.value,
//     this.inputMask,
//     this.suffixText,
//   });

//   factory TemplateFieldModelEquatable.fromJson(Map<String, dynamic> json) {
//     return _$TemplateFieldModelEquatableFromJson(json);
//   }

//   final String fieldID;
//   final String? title;
//   final int idx;
//   final bool isRequired;
//   final List<String> options;
//   final String? defaultValue;
//   final String? value;
//   final String? inputMask;
//   final String? suffixText;

//   @override
//   List<Object?> get props => [
//         fieldID,
//         title,
//         idx,
//         isRequired,
//         options,
//         defaultValue,
//         value,
//         inputMask,
//         suffixText,
//       ];
// }
