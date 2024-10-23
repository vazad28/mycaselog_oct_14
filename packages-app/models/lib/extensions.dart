import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

extension RealmListX<T> on List<T> {
  RealmList<T> get toRealmList => RealmList<T>(this);
}

// extension on RealmValue {
//   dynamic toJson() {
//     return switch (value) {
//       final List<RealmValue> list => list.map((e) => e.toJson()).toList(),
//       final Map<String, RealmValue> map =>
//         map.map((k, v) => MapEntry(k, v.toJson())),
//       // sets are not used in JSON, but we can convert them to lists
//       final Set<RealmValue> set => set.map((e) => e.toJson()).toList(),
//       final Set set => set.toList(), // set of primitives
//       _ => value, // primitives
//     };
//   }
// }

extension ChangeCaseX on String? {
  String? get snakeCase {
    if (this == null) return null;
    // ignore: unnecessary_this
    final words = this!.split(RegExp('(?=[A-Z])'));
    return words.map((word) => word.toLowerCase()).join('_');
  }
}

class TemplateFieldModelConverter
    implements JsonConverter<RealmValue, List<Map<String, dynamic>>> {
  const TemplateFieldModelConverter();

  @override
  RealmValue fromJson(List<Map<String, dynamic>> json) => RealmValue.from(json);

  @override
  List<Map<String, dynamic>> toJson(RealmValue object) =>
      object.value! as List<Map<String, dynamic>>;
}
