extension ListExtension on List {
  bool get containsNull {
    bool isEmpty = false;
    for (var item in this) {
      if (item == null) isEmpty = true;
    }
    return isEmpty;
  }

  bool containsIndex(int i) {
    return i < length && 0 <= i;
  }

  String get concatenate {
    String value = "";
    forEach((element) => value += element.toString());
    return value;
  }
}