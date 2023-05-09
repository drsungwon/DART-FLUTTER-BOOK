import 'dart:io';
import 'package:hive/hive.dart';

class Student {
  Student({required this.id, required this.name, required this.dept});

  String id;
  String name;
  String dept;

  @override
  String toString() {
    return '$id: $name - $dept';
  }
}

void runHelloHive() async {
  var path = Directory.current.path;
  Hive.init(path);
  Hive.registerAdapter(StudentAdapter());
  var box = await Hive.openBox('studentDB');

  var student1 = Student(
    id: 'STUD#0001',
    name: 'Dart',
    dept: 'Seoul',
  );

  var student2 = Student(
    id: 'STUD#0002',
    name: 'Flutter',
    dept: 'Bundang',
  );

  await box.put('STUD#0001', student1);
  print('STUD#0001 : ${box.get('STUD#0001')}');

  await box.put('STUD#0002', student2);
  print('STUD#0002 : ${box.get('STUD#0002')}');
}

class StudentAdapter extends TypeAdapter<Student> {
  @override
  final typeId = 0;

  @override
  Student read(BinaryReader reader) {
    var x = reader.readDouble().toString();
    var y = reader.readDouble().toString();
    var z = reader.readDouble().toString();

    return Student(id: x, name: y, dept: z);
  }

  void write(BinaryWriter writer, Student obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.dept);
  }
}
