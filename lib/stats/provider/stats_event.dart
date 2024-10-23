part of 'stats_provider.dart';

@Freezed(
    copyWith: false,
    equal: false,
    when: FreezedWhenOptions.none,
    map: FreezedMapOptions(maybeMap: false, mapOrNull: false),)
class StatsEvent with _$StatsEvent {
  const factory StatsEvent.add() = _Add;
}
