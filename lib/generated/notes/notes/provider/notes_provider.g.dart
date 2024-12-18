// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../notes/notes/provider/notes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noteTileStyleHash() => r'460b4ee5141e2ec4cb817874d4c89f9ca96c36ae';

/// note tile style provider
///
/// Copied from [NoteTileStyle].
@ProviderFor(NoteTileStyle)
final noteTileStyleProvider =
    AutoDisposeNotifierProvider<NoteTileStyle, NoteTileStyleEnum>.internal(
  NoteTileStyle.new,
  name: r'noteTileStyleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$noteTileStyleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NoteTileStyle = AutoDisposeNotifier<NoteTileStyleEnum>;
String _$notesNotifierHash() => r'e3998e15108a5f044ff7e69171ae5be8087497b0';

/// See also [NotesNotifier].
@ProviderFor(NotesNotifier)
final notesNotifierProvider = AutoDisposeStreamNotifierProvider<NotesNotifier,
    RealmResultsChanges<NoteModel>>.internal(
  NotesNotifier.new,
  name: r'notesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotesNotifier
    = AutoDisposeStreamNotifier<RealmResultsChanges<NoteModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
