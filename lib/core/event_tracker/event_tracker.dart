import 'package:authentication_client/authentication_client.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:firebase_performance/firebase_performance.dart';

final eventTracker = _EventTracker();

class _EventTracker {
  /// Create as singleton class
  factory _EventTracker() => _singleton;

  _EventTracker._internal();
  static final _EventTracker _singleton = _EventTracker._internal();

  //static final _firebaseAnalytics = FirebaseAnalytics.instance;

  Future<void> log(String name, [Map<String, dynamic>? params]) async {
    // Copy params, since we might receive a `const` map which we can't modify.
    params ??= {};
    // await _firebaseAnalytics.setAnalyticsCollectionEnabled(true);
    // await _firebaseAnalytics.logEvent(
    //   name: name,
    //   parameters: Map<String, Object>.from(params),
    // );
  }

  Future<void> screen(String screenName, [Map<String, dynamic>? params]) async {
    // await _firebaseAnalytics.setAnalyticsCollectionEnabled(true);
    // await _firebaseAnalytics.logScreenView(screenName: screenName);
  }

  Future<void> setUser(AuthenticationUser user) async {
    if (user.isAnonymous) return;
    // await _firebaseAnalytics.setAnalyticsCollectionEnabled(true);
    // await _firebaseAnalytics.setUserId(id: user.id);
  }

  Future<void> logOut() async {
    // await _firebaseAnalytics.setAnalyticsCollectionEnabled(true);
    // await _firebaseAnalytics.setUserId();
  }

  Future<void> logAppOpen([String stationId = '']) async {
    // await _firebaseAnalytics.setAnalyticsCollectionEnabled(true);
    // await _firebaseAnalytics.logAppOpen();
    // await _firebaseAnalytics.setUserProperty(name: 'station', value: stationId);
  }

  // Trace startTrace(String trace) {
  //   return FirebasePerformance.instance.newTrace(trace);
  // }

  Future<void> logShare({
    String name = 'share',
    String contentType = 'share_text',
    String itemId = 'android_app',
    Map<String, dynamic>? aParams,
    String? method,
  }) async {
    // await _firebaseAnalytics.setAnalyticsCollectionEnabled(true);

    final params = {
      for (final p in (aParams ?? {}).entries) p.key: p.value,
      'id': itemId,
      'type': contentType,
    };
    if (method != null) {
      params['method'] = method;
    } else {
      method = 'generic';
    }
    // await _firebaseAnalytics.logShare(
    //   contentType: contentType,
    //   itemId: itemId,
    //   method: method,
    // );
  }

  Future<void> logListenTime(String stationId, int time) async {
    // await _firebaseAnalytics.setAnalyticsCollectionEnabled(true);
    // await _firebaseAnalytics.logEvent(
    //   name: 'listen_time',
    //   parameters: {'listen_time': time, 'station': stationId},
    // );
  }

  Future<void> logLogin() async {
    // await _firebaseAnalytics.setAnalyticsCollectionEnabled(true);
    // await _firebaseAnalytics.logLogin(loginMethod: 'phone');
  }
}
