import 'dart:io';

void main() {
  stdout.write("[1] Write & Enter : ");
  var tmpInput = stdin.readLineSync();
  stdout.writeln("[1] You wrote : $tmpInput");

  while (tmpInput != "exit") {
    stdout.write("[2] Write & Enter ('exit' to stop) : ");
    tmpInput = stdin.readLineSync();
    stdout.writeln("[2] You wrote : $tmpInput");
  }

  stdout.write("[3] Single number : ");
  tmpInput = stdin.readLineSync();
  stdout.writeln(
      "[3] You wrote $tmpInput and its type is ${tmpInput.runtimeType}");

  var iList = <int>[];
  stdout.write("[4] Single number : ");
  tmpInput = stdin.readLineSync(); // tmpInput is nullable
  iList.add(int.parse(tmpInput!)); // int.parse() is non-nullable
  stdout.write("[4] Single number again : ");
  tmpInput = stdin.readLineSync();
  iList.add(int.parse(tmpInput ?? '1'));
  stdout.writeln(
      "[4] Result : ${iList[0]} x ${iList[1]} = ${iList[0] * iList[1]}");

  var sList = <String>[];
  stdout.write("[5] Two numbers (ex: 3, 3) : ");
  tmpInput = stdin.readLineSync(); // tmpInput is nullable
  sList = tmpInput!.split(','); // split() requires non-nullable
  var index = 0;
  for (var item in sList) {
    iList[index] = int.parse(sList[index]);
    index++;
  }
  stdout.writeln(
      "[5] Result : ${iList[0]} x ${iList[1]} = ${iList[0] * iList[1]}");

  // Stdin : https://api.dart.dev/stable/dart-io/Stdin-class.html
  // Stdout : https://api.dart.dev/stable/dart-io/Stdout-class.html
  // dart:io : https://api.dart.dev/stable/dart-io/dart-io-library.html
}
