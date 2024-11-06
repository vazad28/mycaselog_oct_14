import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../search.dart';

///  Search type toggle switcher
class SearchTypeWidget extends ConsumerWidget with SearchMixin {
  const SearchTypeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchType = watchSearchType(ref);
    if (searchType == SearchType.cases) {
      return IconButton(
        onPressed: () => updateSearchType(ref, SearchType.media),
        icon: const Icon(Icons.list_alt),
      );
    } else {
      return IconButton(
        onPressed: () => updateSearchType(ref, SearchType.cases),
        icon: const Icon(Icons.photo),
      );
    }
  }
}
