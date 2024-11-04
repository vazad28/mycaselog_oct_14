part of './collections.dart';

/// Cases data collection
class CasesCollection extends RealmCollection<CaseModel>
    with RefreshBacklinksMixin {
  CasesCollection(super.realmDatabase);

  @override
  String get path => '$root/$userID/${DbCollection.cases.name}';

  @override
  String getPrimaryKey(CaseModel model) => model.caseID;

  @override
  CaseModel mapToModel(Map<String, dynamic> json) {
    return CaseModelX.fromJson(json);
  }

  @override
  Map<String, dynamic> modelToMap(CaseModel model) {
    return model.toJson();
  }

  @override
  Future<void> add(CaseModel model) {
    return realm.writeAsync(() {
      model.timestamp = ModelUtils.getTimestamp;
      realm.add<CaseModel>(model, update: true);
    });
  }

  /// Retrieves autocomplete data for a specific field in cases.
  ///
  /// Takes an optional query string and the field name as parameters.
  /// Performs a case-insensitive text search on the specified field.
  /// Returns a list of unique, non-null values for the field.
  /// Throws an exception if the provided field is not supported.
  Future<List<String>> getAutoCompleteData(String? query, String field) async {
    final list = _getAutoCompleteList(query, field);

    Iterable<String?> resList = [];

    if (field == BasicDataModelProps.diagnosis.name) {
      resList = list.map((e) => e.diagnosis);
    } else if (field == BasicDataModelProps.surgery.name) {
      resList = list.map((e) => e.surgery);
    } else {
      throw Exception('Unknown field for autocomplete');
    }
    return resList.nonNulls.toList();
  }

  /// Retrieves a RealmResults object containing cases used for autocomplete
  /// suggestions.
  ///
  /// Takes an optional query string and the field name as parameters.
  /// If no query is provided, retrieves the first 50 distinct values for the
  /// field.
  /// Otherwise, performs a case-insensitive text search on the specified field.
  /// Returns a RealmResults object containing the matching cases.
  RealmResults<CaseModel> _getAutoCompleteList(String? query, String field) {
    return (query == null)
        ? realm.query<CaseModel>(
            '$field CONTAINS ALL[*] DISTINCT($field) LIMIT(50)',
          )
        : realm.query<CaseModel>(
            '$field CONTAINS[c] \$0 DISTINCT($field) LIMIT(50)',
            [query],
          );
  }

  /// Searches for cases containing a specific search term in various fields.
  ///
  /// Takes the search term as a parameter.
  /// Performs a case-insensitive text search on diagnosis, surgery, comments,
  /// and patient initials fields.
  /// Sorts the results by timestamp in descending order.
  /// Returns a RealmResults object containing the matching cases.
  RealmResults<CaseModel> search(String searchTerm) {
    return realm.query<CaseModel>(
      r'''
        (diagnosis TEXT $0 OR 
        surgery TEXT $0 OR 
        comments TEXT $0 OR 
        patientModel.initials TEXT $0 OR 
        patientModel.name TEXT $0) AND removed == 0 SORT(timestamp DESC)''',
      ['$searchTerm*'],
    );
  }

  /// Refreshes media backlinks for a given list of CaseModel objects
  /// or all cases if not provided.
  void refreshBacklinks() => refreshCasesBacklinks(realm, null);

  /// Retrieves cases that fall within a specific date range and optionally
  /// filtered by case IDs.
  ///
  /// Takes the start and end timestamps and an optional list of case IDs
  /// as parameters.
  /// Filters cases based on the removed flag being set to false and the
  /// surgery date falling within the provided timestamp range.
  /// If a list of case IDs is provided, further filters the results to include
  /// only cases with matching IDs.

  /// Get cases between two timestamps among caseIDs
  RealmResults<CaseModel> casesBetweenTimestamp({
    required int fromTimestamp,
    required int toTimestamp,
    Iterable<String>? idList,
  }) {
    final params = [0, fromTimestamp, toTimestamp];
    final cases = realm.query<CaseModel>(
      r'''
        removed == $0 AND 
        surgeryDate BETWEEN{$1, $2}''',
      params,
    );
    return idList != null ? cases.query(r'caseID IN $0', [idList]) : cases;
  }

  /// Retrieves a list of CaseModel objects based on their case IDs.
  RealmResults<CaseModel> getAllByCaseIDs(List<String> caseIDs) {
    return realm.query<CaseModel>(r'caseID IN $0', [caseIDs]);
  }

  /// Retrieves the year of the first case in the database.
  int? firstCaseYear() {
    final cases = realm.query<CaseModel>('TRUEPREDICATE SORT(surgeryDate ASC)');
    return cases.isEmpty ? null : cases.first.surgeryDate;
  }
}
