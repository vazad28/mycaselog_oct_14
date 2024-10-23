// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

$CaseModel _$$CaseModelFromJson(Map<String, dynamic> json) => $CaseModel()
  ..caseID = json['caseID'] as String
  ..surgeryDate = (json['surgeryDate'] as num).toInt()
  ..createdAt = (json['createdAt'] as num).toInt()
  ..anesthesia = json['anesthesia'] as String?
  ..anesthesiaBlock = json['anesthesiaBlock'] as String?
  ..asa = (json['asa'] as num).toInt()
  ..assistant =
      (json['assistant'] as List<dynamic>).map((e) => e as String).toList()
  ..comments = json['comments'] as String?
  ..cpt = json['cpt'] as String?
  ..diagnosis = json['diagnosis'] as String?
  ..ebl = (json['ebl'] as num).toInt()
  ..icd = json['icd'] as String?
  ..location = json['location'] as String?
  ..side = json['side'] as String?
  ..surgery = json['surgery'] as String?
  ..templateID = json['templateID'] as String?
  ..removed = (json['removed'] as num).toInt()
  ..timestamp = (json['timestamp'] as num).toInt()
  ..patientModel = json['patientModel'] == null
      ? null
      : _PatientModel.fromJson(json['patientModel'] as Map<String, dynamic>)
  ..fieldsData = (json['fieldsData'] as List<dynamic>)
      .map((e) => $TemplateFieldModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$$CaseModelToJson($CaseModel instance) =>
    <String, dynamic>{
      'caseID': instance.caseID,
      'surgeryDate': instance.surgeryDate,
      'createdAt': instance.createdAt,
      'anesthesia': instance.anesthesia,
      'anesthesiaBlock': instance.anesthesiaBlock,
      'asa': instance.asa,
      'assistant': instance.assistant,
      'comments': instance.comments,
      'cpt': instance.cpt,
      'diagnosis': instance.diagnosis,
      'ebl': instance.ebl,
      'icd': instance.icd,
      'location': instance.location,
      'side': instance.side,
      'surgery': instance.surgery,
      'templateID': instance.templateID,
      'removed': instance.removed,
      'timestamp': instance.timestamp,
      'patientModel': instance.patientModel?.toJson(),
      'fieldsData': instance.fieldsData.map((e) => e.toJson()).toList(),
    };

_PatientModel _$PatientModelFromJson(Map<String, dynamic> json) =>
    _PatientModel()
      ..patientID = json['patientID'] as String?
      ..crypt = json['crypt'] as String?
      ..initials = json['initials'] as String?
      ..name = json['name'] as String?
      ..yob = json['yob'] as String?
      ..bmi = (json['bmi'] as num?)?.toDouble()
      ..gender = json['gender'] as String?
      ..mrn = json['mrn'] as String?
      ..phone = json['phone'] as String?
      ..address = json['address'] as String?;

Map<String, dynamic> _$PatientModelToJson(_PatientModel instance) =>
    <String, dynamic>{
      'patientID': instance.patientID,
      'crypt': instance.crypt,
      'initials': instance.initials,
      'name': instance.name,
      'yob': instance.yob,
      'bmi': instance.bmi,
      'gender': instance.gender,
      'mrn': instance.mrn,
      'phone': instance.phone,
      'address': instance.address,
    };

DecryptedPatientModel _$DecryptedPatientModelFromJson(
        Map<String, dynamic> json) =>
    DecryptedPatientModel(
      name: json['name'] as String?,
      mrn: json['mrn'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$DecryptedPatientModelToJson(
        DecryptedPatientModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'mrn': instance.mrn,
      'name': instance.name,
      'phone': instance.phone,
    };

_TimelineNoteModel _$TimelineNoteModelFromJson(Map<String, dynamic> json) =>
    _TimelineNoteModel()
      ..noteID = json['noteID'] as String
      ..authorID = json['authorID'] as String
      ..caseID = json['caseID'] as String
      ..note = json['note'] as String?
      ..createdAt = (json['createdAt'] as num).toInt()
      ..timestamp = (json['timestamp'] as num).toInt()
      ..removed = (json['removed'] as num).toInt();

Map<String, dynamic> _$TimelineNoteModelToJson(_TimelineNoteModel instance) =>
    <String, dynamic>{
      'noteID': instance.noteID,
      'authorID': instance.authorID,
      'caseID': instance.caseID,
      'note': instance.note,
      'createdAt': instance.createdAt,
      'timestamp': instance.timestamp,
      'removed': instance.removed,
    };
