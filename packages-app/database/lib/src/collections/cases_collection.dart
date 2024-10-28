part of './collections.dart';

/// Cases data collection
class CasesCollection extends RealmCollection<CaseModel>
    with RefreshBacklinksMixin {
  CasesCollection(super.realmDatabase);

  @override
  String get path => '$root/$userID/${DbCollection.cases.name}';

  @override
  String getPrimaryKey(CaseModel model) {
    return model.caseID;
  }

  @override
  CaseModel mapToModel(Map<String, dynamic> json) {
    return CaseModelX.fromJson(json);
  }

  @override
  Map<String, dynamic> modelToMap(CaseModel model) {
    return model.toJson();
  }

  @override
  Future<void> add(CaseModel model) async {
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
        ? realm.query<CaseModel>('$field CONTAINS ALL[*] LIMIT(50)')
        : realm.query<CaseModel>('$field CONTAINS[c] \$0', [query]);
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
        diagnosis TEXT $0 OR 
        surgery TEXT $0 OR 
        comments TEXT $0 OR 
        patientModel.initials TEXT $0 OR 
        patientModel.name TEXT $0 AND removed == 0 SORT(timestamp DESC)''',
      ['$searchTerm*'],
    );
  }

  /// Refreshes media backlinks for a given list of CaseModel objects
  /// or all cases if not provided.
  void refreshBacklinks() => refreshCasesBacklinks(realm, null);
}
