import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../stats.dart';

class StatsView extends ConsumerWidget {
  const StatsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(statsNotifierProvider);

    return const Center(child: Text('StatsView'));
  }
}
