void printStar(var item) {
  print("\u{2605} $item \u{2605}");
}

void printStarWithDefault(String item, [String mark = '\u{1F499}']) {
  print("$mark $item $mark");
}

void printStarWithNull(String item, [String? mark]) {
  if (mark == null) {
    print("\u{2605} $item \u{2605}");
  } else {
    print("$mark $item $mark");
  }
}

enum Color { red, green, blue }

/*
String missingReturn() {
  // No return.
}
*/

void main() {
  print("[1] Unicode Presentation");

  print('\u{AC00}');
  Map dicEmoji = {
    'A': '\u{0041}',
    'a': '\u{0061}',
    'clap': '\u{1f44f}',
    'smile': '\u{1F642}',
    'star': '\u{2605}'
  };
  print("$dicEmoji");
  // Unicode Reference: https://home.unicode.org/

  print("\n[2] Cascade Operators");

  List iList = [];
  iList
    ..addAll([2, 1])
    ..add(0)
    ..sort((a, b) => a.compareTo(b));
  print("$iList");

  print("\n[3] forEach Method");

  iList.forEach(printStar);

  print("\n[4] forEach Method with Nested Function");

  void printSmile(var item) {
    print("\u{1F642} $item \u{1F642}");
  }

  iList.forEach(printSmile);

  print("\n[5] Conditional Expression");

  var result = dicEmoji.isEmpty ? "dicEmoji is empty" : "dicEmoji is not empty";
  print(result);

  print("\n[6] Bitwise Operators");

  int bitOne = 1; // 00000001
  int bitTwo = 2; // 00000010
  // 00000010, 00000001, 00000011, 00000000
  print("${bitOne << 1} ${bitTwo >> 1} ${bitOne | bitTwo} ${bitOne & bitTwo}");

  print("\n[7] Hexa Decimal Presentation");

  num var1 = 0x01;
  num var2 = 0xFF;
  print(var1);
  print(var2);

  print("\n[8] Exponential Presentation");

  num varE = 1.1e2;
  print(varE);

  print("\n[9] String to Number Conversion");

  num varI = int.parse('1');
  num varD = double.parse('1.1');
  print(varI);
  print(varD);

  print("\n[10] Enumerator");

  print(Color.values);
  Color chColor = Color.red;
  print(chColor);

  print("\n[11] Null Safety");

  int iTemp = 3;
  print(iTemp);
  int iNonNullableInt;
  //print(iNonNullableInt);
  //iTemp = iNonNullableInt;

  int? iNullableInt;
  iNullableInt = null;
  print(iNullableInt);
  //print(iNullableInt.abs());

  //iNonNullableInt = null;
  //iTemp = iNullableInt;

  print(iNullableInt.runtimeType);

  printStarWithDefault('null-safety');
  printStarWithNull('null-safety');

  iNullableInt = null;
  // if left is null, then right
  print(iNullableInt ?? iTemp);

  iNullableInt = 1;
  print(iNullableInt ?? iTemp);

  iNullableInt = null;
  // if left is null, then left is right
  iNonNullableInt = (iNullableInt ??= iTemp);
  print(iNonNullableInt);

  iNullableInt = 1;
  iNonNullableInt = (iNullableInt ??= iTemp);
  print(iNonNullableInt);

  iNullableInt = null;
  // if left is not null, then call abs()
  print(iNullableInt?.abs());

  iNullableInt = 1;
  print(iNullableInt?.abs());

  //missingReturn();

  var map = {'key': 'value'};
  //print(map['key'].length);
  print(map['key']!.length);

  var map2 = {'key': 1};
  //print(map2['key'].length);
  //print(map2['key']!.length);

  // Null Class Reference: https://api.dart.dev/stable/dart-core/Null-class.html
  // Null Safety Reference: https://dart.dev/null-safety/understanding-null-safety
}
