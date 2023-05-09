void main() {
  Set setFill = {1, 2};
  Set setEmpty = {};

  print("[01] setFill : $setFill");
  print("[02] setEmpty : $setEmpty");

  setFill.add(3);
  print("[03] setFill with add(3) : $setFill");

  setEmpty.addAll([3, 4, 5]);
  print("[04] setEmpty with addAll({3, 4, 5}) : $setEmpty");

  print("[05] 3 in setFill ? : ${setFill.contains(3)}");
  print("[06] 5 in setFill ? : ${setFill.contains(5)}");

  print("[07] Union of setFill and setEmpty : ${setFill.union(setEmpty)}");
  print("[08] Intersection of setFill and setEmpty : ${setFill.intersection(setEmpty)}");
  print("[09] Difference of setFill to setEmpty : ${setFill.difference(setEmpty)}");

  setFill.remove(3);
  print("[10] setFill with remove(3) : $setFill");

  Set<int> exSet1 = {1, 2, 3};
  var exSet2 = <int>{};

  print("[11] exSet1 : $exSet1");
  print("[12] exSet2 : $exSet2");

  print("[13] Type of setFill : ${setFill.runtimeType}");
  print("[14] Type of setEmpty : ${setEmpty.runtimeType}");
  print("[15] Type of exSet1 : ${exSet1.runtimeType}");
  print("[16] Type of exSet2 : ${exSet2.runtimeType}");

  // Reference : https://api.flutter.dev/flutter/dart-core/Set-class.html
}
