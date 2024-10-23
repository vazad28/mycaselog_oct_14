import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../media.dart';

class MediaPage extends ConsumerWidget {
  const MediaPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: MediaPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(mediaNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaScreen'),
      ),
      body: const MediaView(),
    );
  }
}
