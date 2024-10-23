class DbException implements Exception {
  DbException(this.error);
  final String error;
}
