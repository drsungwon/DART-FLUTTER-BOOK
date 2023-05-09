import 'dart:io';
import 'dart:convert';

Future<String> readFileToString(String fileName) async {
  var file = File(fileName);
  String fileContent = await file.readAsString();
  return fileContent;
}

Future<List<String>> readFileToList(String fileName) async {
  Stream<String> lines = File(fileName)
      .openRead() // Creates a new Stream for the contents of given file
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.

  try {
    List<String> sList = [];
    await for (var line in lines) {
      sList.add(line);
    }
    return sList;
  } catch (error) {
    throw (error);
  }
}

void main() async {
  print("[1] File read scenario #1.");

  try {
    String fileContent = await readFileToString('src.txt');
    print(fileContent);
  } catch (error) {
    print(error);
  }

  print("[2] File read scenario #2.");

  try {
    List<String> fileContent = await readFileToList('src.txt');
    for (var fileLine in fileContent) {
      print(fileLine);
    }
  } catch (error) {
    print(error);
  }

  print("[3] File write.");

  List<String> fileContent = await readFileToList('src.txt');

  var sList = [];
  var iVar1 = 0;
  var iVar2 = 0;
  var count = 0;

  var dstSink = File('dst.txt').openWrite();

  dstSink.write(':=> FILE ACCESSED ${DateTime.now()}\n');
  for (var fileLine in fileContent) {
    sList = fileLine.split(',');
    iVar1 = int.parse(sList[0]);
    iVar2 = int.parse(sList[1]);
    print("$iVar1 x $iVar2 = ${iVar1 * iVar2}");
    dstSink.write("$iVar1 x $iVar2 = ${iVar1 * iVar2}\n");
    count++;
  }
  dstSink.write(':=> $count ITEMS CALCULATED');

  dstSink.close(); // Close the IOSink to free system resources.
}

// File : https://api.dart.dev/stable/dart-io/File-class.html
// Stream : https://api.dart.dev/stable/dart-async/Stream-class.html