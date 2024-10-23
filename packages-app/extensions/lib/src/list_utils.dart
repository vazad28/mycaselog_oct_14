extension ListUpdate<T> on List<T> {
  List<T> replaceOrAdd(T obj) {
    final index = indexOf(obj);
    if (index >= 0) {
      removeAt(index);
      insert(index, obj);
    } else {
      add(obj);
    }
    return this;
  }

  List<T> replaceOrAddComplex(T obj, String Function(T) getId) {
    final index = indexWhere((element) => getId(element) == getId(obj));
    if (index >= 0) {
      removeAt(index);
      insert(index, obj);
    } else {
      add(obj);
    }
    return this;
  }

  List<T> removeComplex(T obj, String Function(T) getId) {
    final index = indexWhere((element) => getId(element) == getId(obj));
    if (index >= 0) {
      removeAt(index);
    }
    return this;
  }
}
