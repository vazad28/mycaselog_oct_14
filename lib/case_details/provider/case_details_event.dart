part of 'case_details_provider.dart';

@Freezed(
    copyWith: false,
    equal: false,
    when: FreezedWhenOptions.none,
    map: FreezedMapOptions(maybeMap: false, mapOrNull: false),)
class CaseDetailsEvent with _$CaseDetailsEvent {
  const factory CaseDetailsEvent.add() = _Add;
}
