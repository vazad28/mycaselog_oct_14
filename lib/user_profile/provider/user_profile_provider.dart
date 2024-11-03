import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart' show ImagePicker, ImageSource;
import 'package:models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/app.dart';

part '../../generated/user_profile/provider/user_profile_provider.freezed.dart';
part '../../generated/user_profile/provider/user_profile_provider.g.dart';

part 'user_profile_mixin.dart';

/// ////////////////////////////////////////////////////////////////////
/// Signout loading spinner provider
/// ////////////////////////////////////////////////////////////////////
@riverpod
class SignOutButtonNotifier extends _$SignOutButtonNotifier {
  @override
  bool build() => false;
  // ignore: avoid_positional_boolean_parameters
  bool update({required bool value}) => state = value;
}

/// ////////////////////////////////////////////////////////////////////
/// Main Providers
/// ////////////////////////////////////////////////////////////////////
@riverpod
class UserProfileNotifier extends _$UserProfileNotifier {
  //AuthenticationUser get user => ref.watch(authenticationUserProvider);

  @override
  UserModel build() {
    final sub =
        ref.watch(dbProvider).userCollection.getAll().changes.listen((data) {
      if (data.results.isNotEmpty) {
        state = data.results.last.toUnmanaged();
      }
    });

    ref.onDispose(sub.cancel);

    return ref
        .watch(dbProvider)
        .userCollection
        .userModelFromUser(ref.read(authenticationUserProvider));
  }

  /// Map events to state
  void on(UserProfileEvent event) {
    event.map(
      updateDisplayName: (v) => _updateUserModel(
        state..displayName = v.displayName,
      ),
      updateSpeciality: (v) => _updateUserModel(
        state..speciality = v.speciality,
      ),
      updateSubSpeciality: (v) => _updateUserModel(
        state..subSpeciality = v.subSpeciality,
      ),
      uploadAvatar: (v) => _uploadAvatar(
        v.imageSource,
      ),
      updateAbout: (v) => _updateUserModel(
        state..about = v.about,
      ),
    );
  }

  /// Save user model with any updates
  void _updateUserModel(UserModel userModel) {
    /// we are not saving data if the user is anonymous as can happen on logout
    if (userModel.userID.isEmpty) return;
    ref.watch(dbProvider).userCollection.upsert(() => userModel);
  }

  /// Upload user avatar photo
  Future<void> _uploadAvatar(ImageSource imageSource) async {
    final localFile = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 90,
      maxHeight: 600,
      maxWidth: 600,
    );

    if (localFile == null) return; //like a pick was cancelled

    final file = File(localFile.path);

    await ref
        .watch(dbProvider)
        .storageCollection
        .uploadAvatar(file)
        .then((value) {
      ref.watch(dialogServiceProvider).showSnackBar('success');
      state = state..photoUrl = value;
    }).catchError((err) async {
      await Future<void>.delayed(const Duration(milliseconds: 300));
      ref
          .watch(dialogServiceProvider)
          .showSnackBar('Error in uploading new avatar');
    });
  }
}

@riverpod
UserStatsModel userMiniStats(UserMiniStatsRef ref) {
  return UserStatsModel(
    cases: ref.watch(dbProvider).casesCollection.countAll(),
    //media: ref.watch(dbProvider).mediaCollection.countAll(),
    notes: ref.watch(dbProvider).notesCollection.countAll(),
  );
}
