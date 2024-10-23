import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils/utils.dart';

part '../../generated/media/provider/media_provider.freezed.dart';
part '../../generated/media/provider/media_provider.g.dart';
part 'media_event.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@riverpod
class MediaNotifier extends _$MediaNotifier {
  @override
  StateOf<MediaModel> build() {
    return const StateOf<MediaModel>.init();
  }

  /// Map events to state
  void on(MediaEvent event) {
    event.map(add: (value) => {});
  }
}
