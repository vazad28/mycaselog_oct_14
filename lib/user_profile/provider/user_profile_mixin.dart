part of 'user_profile_provider.dart';

/// ////////////////////////////////////////////////////////////////////
/// Events and Mixin
/// ////////////////////////////////////////////////////////////////////

@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class UserProfileEvent with _$UserProfileEvent {
  const factory UserProfileEvent.updateDisplayName(String? displayName) =
      _UpdateDisplayName;

  const factory UserProfileEvent.updateSpeciality(String speciality) =
      _UpdateSpeciality;

  const factory UserProfileEvent.updateSubSpeciality(String? subSpeciality) =
      _UpdateSubSpeciality;

  const factory UserProfileEvent.uploadAvatar(ImageSource imageSource) =
      _UploadAvatar;

  const factory UserProfileEvent.updateAbout(String? about) = _UpdateAbout;
}

mixin UserProfileEventMixin {
  void updateDisplayName(WidgetRef ref, String? displayName) =>
      ref.watch(userProfileNotifierProvider.notifier).on(
            UserProfileEvent.updateDisplayName(displayName),
          );
  void updateUserSpeciality(WidgetRef ref, String speciality) =>
      ref.watch(userProfileNotifierProvider.notifier).on(
            UserProfileEvent.updateSpeciality(speciality),
          );
  void updateSubSpeciality(WidgetRef ref, String? subSpeciality) =>
      ref.watch(userProfileNotifierProvider.notifier).on(
            UserProfileEvent.updateSubSpeciality(subSpeciality),
          );
  void uploadAvatar(WidgetRef ref, ImageSource imageSource) => ref
      .watch(userProfileNotifierProvider.notifier)
      .on(UserProfileEvent.uploadAvatar(imageSource));

  void updateAbout(WidgetRef ref, String? aboutText) =>
      ref.watch(userProfileNotifierProvider.notifier).on(
            UserProfileEvent.updateAbout(aboutText),
          );
}

mixin UserProfileStateMixin {
  String? userProfilePhotoUrl(WidgetRef ref) => ref.watch(
        userProfileNotifierProvider.select((value) => value.photoUrl),
      );
  String? userDisplayName(WidgetRef ref) => ref.watch(
        userProfileNotifierProvider.select((value) => value.displayName),
      );

  String? userSpeciality(WidgetRef ref) => ref.watch(
        userProfileNotifierProvider.select((value) => value.speciality),
      );
  String? userSubSpeciality(WidgetRef ref) => ref.watch(
        userProfileNotifierProvider.select((value) => value.subSpeciality),
      );
  int? userMemberSince(WidgetRef ref) => ref.watch(
        userProfileNotifierProvider.select((value) => value.creationTime),
      );
  String? userAboutMe(WidgetRef ref) => ref.watch(
        userProfileNotifierProvider.select((value) => value.about),
      );
}
