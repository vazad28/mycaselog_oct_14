import 'package:animations/animations.dart';
import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:realm/realm.dart';
import 'package:ui/ui.dart';

import '../../app/app.dart';
import '../search.dart';

part './search_results_view.dart';
part './suggestion_view.dart';

class SearchPage<T> extends ConsumerStatefulWidget {
  const SearchPage({
    this.trailingWidgets,
    this.hintText = 'search',
    super.key,
  });

  final String? hintText;
  final List<Widget>? trailingWidgets;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState<T>();
}

class _SearchPageState<T> extends ConsumerState<SearchPage<T>>
    with SearchMixin, AppMixins {
  final _searchController = SearchController();
  final _focusNode = FocusScopeNode();

  String? _currentSearchTerm;

  /// Bool to animate view of results vs suggestion list
  bool _showResults = false;

  RealmResults<RealmObject>? _searchResults;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(searchNotifierProvider, (prev, next) {
      if (prev != next) handleSelection();
    });

    final searchAnchor = SearchAnchor(
      isFullScreen: true,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.visiblePassword,
      viewHintText: 'search',
      viewLeading: BackButton(
        onPressed: () {
          Navigator.of(context).pop();
          _searchController.clear();
          _focusNode.unfocus();
        },
      ),
      viewTrailing: [
        IconButton(
          onPressed: () {
            setState(() {
              _searchController.clear();
              _showResults = false;
            });
          },
          icon: const Icon(Icons.clear),
        ),
        // if (T != NoteModel) const SearchTypeWidget(),
      ],
      viewOnSubmitted: (value) {
        _currentSearchTerm = value.trim();
        handleSelection();
      },
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          focusNode: _focusNode,
          elevation: const WidgetStatePropertyAll<double>(0),
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16),
          ),
          onTap: () {
            final searchType = createSearchType<T>();
            updateSearchType(ref, searchType);
            controller.openView();
          },
          leading: const Icon(Icons.search),
          hintText: widget.hintText,
          trailing: widget.trailingWidgets,
        );
      },
      searchController: _searchController,
      viewBuilder: (suggestions) {
        return PageTransitionSwitcher(
          reverse: !_showResults,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: _showResults
              ? SearchResultsView(
                  searchResults: _searchResults,
                  searchType: watchSearchType(ref),
                )
              : SuggestionsView(
                  searchController: _searchController,
                  onTap: (value) {
                    _currentSearchTerm = value.trim();
                    handleSelection();
                  },
                ),
        );
      },
      suggestionsBuilder: (context, controller) {
        return [];
      },
    );

    return searchAnchor;
  }

  void handleSelection() {
    setState(() {
      if (_currentSearchTerm == null) return;
      try {
        _searchController.text = ''; //<- *** to trigger suggestion builder
        _searchResults = ref
            .watch(searchNotifierProvider.notifier)
            .doSearch(_currentSearchTerm!);
        _showResults = true;

        _searchController.value = TextEditingValue(text: _currentSearchTerm!);
      } catch (err) {
        ref
            .read(dialogServiceProvider)
            .showSnackBar('Error handling selection');
        debugPrint(err.toString());
      }
    });
  }
}
