void printMessage(var header, var message) {
  print("[$header] $message");
}

void main() {
  print("[1] Integer Class");
  int iInteger = 3;
  printMessage("1-1", iInteger.abs());
  printMessage("1-2", iInteger.gcd(6));
  printMessage("1-3", iInteger.toString());
  printMessage("1-4", 2.abs());
  printMessage("1-5", 2.gcd(6));
  printMessage("1-6", 2.toString());
  // Reference: https://api.dart.dev/stable/dart-core/int-class.html

  print("[2] Double Class");
  double dDouble = 3.8;
  printMessage("2-1", dDouble.abs());
  printMessage("2-2", dDouble.toString());
  printMessage("2-3", dDouble.floor());
  printMessage("2-4", dDouble.round());
  printMessage("2-5", 1.8.abs());
  printMessage("2-6", 1.8.toString());
  printMessage("2-7", 1.8.floor());
  printMessage("2-8", 1.8.round());
  // Reference: https://api.dart.dev/stable/dart-core/double-class.html

  print("[3] String Class");
  String sString = "Hello, Dart!";
  printMessage("3-1", sString.toLowerCase());
  printMessage("3-2", sString.toUpperCase());
  printMessage("3-3", sString.length);
  printMessage("3-4", sString.substring(0, 5));
  printMessage("3-5", sString[11]);
  // Reference: https://api.dart.dev/stable/dart-core/String-class.html

  print("[4] Boolean Class");
  bool bBoolean = true;
  printMessage("4-1", bBoolean.toString());
  // Reference: https://api.dart.dev/stable/dart-core/bool-class.html

  print("[5] Class Type Operators");
  printMessage("5-1", iInteger is int);
  printMessage("5-2", dDouble is double);
  printMessage("5-3", sString is String);
  printMessage("5-4", bBoolean is bool);
  printMessage("5-5", iInteger is! int);
  printMessage("5-6", dDouble is! double);
  printMessage("5-7", sString is! String);
  printMessage("5-8", bBoolean is! bool);
  var tmpS = "String";
  printMessage("5-9", tmpS is String);
  num tmpI = 1.1;
  printMessage("5-10", tmpI is String);
  printMessage("5-11", tmpI is int);
  printMessage("5-12", tmpI is double);
}
