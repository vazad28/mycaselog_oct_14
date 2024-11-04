Future<void> delay([int milliseconds = 1000]) {
  return Future<void>.delayed(Duration(milliseconds: milliseconds));
}
