import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../media.dart';

class MediaView extends ConsumerWidget {
  const MediaView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaAsync = ref.watch(mediaNotifierProvider);

    return const Center(child: Text('MediaView'));
  }
}
