void main() {
  List iList = [1, 2, 3, 4, 5];

  print("[01] iList is $iList");
  print("[02] Length of iList is ${iList.length}");
  print("[03] First element of iList is ${iList.first}");
  print("[04] Last element of iList is ${iList.last}");
  print("[05] Index of 3 in iList is ${iList.indexOf(3)}");

  iList.insert(2, 99);
  print("[06] iList after insert(2, 99) is $iList");

  iList.add(6);
  print("[07] iList after add(6) is $iList");

  iList.addAll([7, 8, 9]);
  print("[08] iList after addAll([7,8,9]) is $iList");

  iList.sort((a, b) => a.compareTo(b));
  print("[09] iList after sort() is $iList");

  iList.clear();
  print("[10] iList after clear() is $iList");

  List mixedList = [1, 2.2, "Three"];

  print("[11] mixedList is $mixedList");
  print("[12] mixedList[0] is int: ${mixedList[0] is int}");
  print("[13] mixedList[1] is double: ${mixedList[1] is double}");
  print("[14] mixedList[2] is String: ${mixedList[2] is String}");

  print("[15] 'for' loop with \"mixedList[index]\"");
  for (var count = 0; count < mixedList.length; count++) {
    print("[=>] mixedList[$count] is ${mixedList[count]}");
  }

  print("[16] 'for' loop with \"item in mixedList\"");
  var count = 0;
  for (var item in mixedList) {
    print("[=>] mixedList[$count] is $item");
    count++;
  }

  List<int> intList = [1, 2, 3, 4, 5];
  print("[17] intList is List<int>: ${intList is List<int>}");
  print("[18] iList is List<int>: ${iList is List<int>}");
  print("[19] mixedList is List<int>: ${mixedList is List<int>}");
  print("[20] mixedList is List<dynamic>: ${mixedList is List<dynamic>}");
  print("[21] iList is List<dynamic>: ${iList is List<dynamic>}");

  // Error : String element into an integer list
  //intList[0] = "1";

  // Non-Error : String element into a dynamic list
  //iList = [1, 2, 3, 4, 5];
  //iList[0] = "1";

  // Reference : https://api.dart.dev/stable/2.14.4/dart-core/List-class.html
  // Reference : https://api.flutter.dev/flutter/dart-core/num/compareTo.html
}
