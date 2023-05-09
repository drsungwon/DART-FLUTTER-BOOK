import 'dart:io';
import 'package:hive/hive.dart';

void runHelloHive() async {
  var path = Directory.current.path;
  Hive.init(path);
  var box = await Hive.openBox('studentDB');

  box.put('STUD#0001', 'Dart');
  box.put('STUD#0002', 'Flutter');

  print('STUD#0001 : ${box.get('STUD#0001')}');
  print('STUD#0002 : ${box.get('STUD#0002')}');
}
