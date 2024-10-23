import 'package:realm/realm.dart';

import 'firestore_collection.dart';

abstract class RealmCollection<T extends RealmObject>
    extends FirestoreCollection<T> {
  /// Constructor
  RealmCollection(
    super.realmDatabase, // Realm database instance
  );

  /// ////////////////////////////////////////////////////////////////////
  /// READ METHODS
  /// ////////////////////////////////////////////////////////////////////

  // Retrieves a single item from Realm based on its primary key
  T? getSingle(String primaryKey) => realm.find<T>(primaryKey);

  // Retrieves all items from Realm, optionally sorted by a specific field
  RealmResults<T> getAll({
    String? orderByField, // Field to sort by
    OrderByType orderByType = OrderByType.descending, // Sort order
  }) {
    if (orderByField != null) {
      // Query Realm with sorting
      return realm
          .query<T>('TRUEPREDICATE SORT($orderByField ${orderByType.type})');
    }
    // Return all items without sorting
    return realm.all<T>();
  }

  // Returns the total count of non-removed items in Realm for this collection
  int countAll() => realm.all<T>().query(r'removed == $0', [0]).length;

  /// ////////////////////////////////////////////////////////////////////
  /// WRITE METHODS
  /// ////////////////////////////////////////////////////////////////////
  /// add new model to realm by using insert,
  /// we keep
  Future<void> add(T model);

  // Upserts data in Realm by executing the provided callback function
  Future<T> upsert(T Function() upsertCallback) async {
    try {
      return realm.writeAsync<T>(() {
        return realm.add<T>(
          upsertCallback.call(),
          update: true,
        );
      });
    } catch (err) {
      rethrow;
    }
  }

  /// Insert data in Realm
  // Future<T> insert(T model) async {
  //   try {
  //     return realm.writeAsync<T>(() {
  //       return realm.add<T>(model, update: true);
  //     });
  //   } catch (err) {
  //     rethrow;
  //   }
  // }
}

enum OrderByType {
  descending('DESC'),
  ascending('ASC');

  const OrderByType(this.type);
  final String type;
}
