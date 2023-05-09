void main() {
  print("[Step.1] Map Creation");
  Map dbFruit = {"A001": "Apple", "A002": "Mango"};
  var dbEmpty = <dynamic, dynamic>{};
  print("dbFruit is $dbFruit");
  print("dbEmpty is $dbEmpty");

  print("\n[Step.2] Map Properties");
  print("dbFruit.length is ${dbFruit.length}");
  print("dbFruit[\"A001\"] is ${dbFruit["A001"]}");
  print("dbFruit.runtimeType is ${dbFruit.runtimeType}");
  print("dbFruit.isNotEmpty is ${dbFruit.isNotEmpty}");
  print("dbEmpty.runtimeType is ${dbEmpty.runtimeType}");
  print("dbEmpty.isEmpty is ${dbEmpty.isEmpty}");

  print("\n[Step.3] Map Addition");
  dbFruit["A003"] = "Banana";
  print("'dbFruit + <A003 : Banana>' is $dbFruit");
  dbEmpty.addAll(dbFruit);
  print("'dbEmpty += dbFruit' is $dbEmpty");

  print("\n[Step.4] Map Replace");
  dbFruit["A003"] = "Orange";
  print("dbFruit is $dbFruit");

  print("\n[Step.5] Map containsKey() and containsValue()");
  print("Key 'A002' in dbFruit ? : ${dbFruit.containsKey("A002")}");
  print("Key 'A004' in dbFruit ? : ${dbFruit.containsKey("A004")}");
  print("Value 'Apple' in dbFruit ? : ${dbFruit.containsValue("Apple")}");
  print("Value 'Kiwi' in dbFruit ? : ${dbFruit.containsValue("Kiwi")}");

  print("\n[Step.6] Map Removal");
  dbFruit.remove("A002");
  print("dbFruit is $dbFruit");

  print("\n[Step.7] Map Clear");
  dbEmpty.clear();
  print("dbEmpty is $dbEmpty");

  // Reference : https://api.flutter.dev/flutter/dart-core/Map-class.html
}
