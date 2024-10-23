part of 'media_provider.dart';

@Freezed(
    copyWith: false,
    equal: false,
    when: FreezedWhenOptions.none,
    map: FreezedMapOptions(maybeMap: false, mapOrNull: false),)
class MediaEvent with _$MediaEvent {
  const factory MediaEvent.add() = _Add;
}
