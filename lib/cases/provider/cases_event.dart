part of 'cases_provider.dart';

@Freezed(
    copyWith: false,
    equal: false,
    when: FreezedWhenOptions.none,
    map: FreezedMapOptions(maybeMap: false, mapOrNull: false),)
class CasesEvent with _$CasesEvent {
  const factory CasesEvent.add() = _Add;
}
