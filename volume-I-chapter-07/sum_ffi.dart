import 'dart:ffi';
import 'dart:io';

import 'package:path/path.dart' as path;

typedef SumFunc = Int32 Function(Int32 a, Int32 b);
typedef Sum = int Function(int a, int b);

void main() {
  // Open the dynamic library
  var libraryPath =
      path.join(Directory.current.path, 'sum_ffi_library', 'libsum_ffi.so');
  if (Platform.isMacOS) {
    libraryPath = path.join(
        Directory.current.path, 'sum_ffi_library', 'libsum_ffi.dylib');
  }
  if (Platform.isWindows) {
    libraryPath = path.join(
        Directory.current.path, 'sum_ffi_library', 'Debug', 'sum_ffi.dll');
  }

  final dylib = DynamicLibrary.open(libraryPath);

  // calls int sum(int a, int b);
  final sumPointer = dylib.lookup<NativeFunction<SumFunc>>('sum');
  final sum = sumPointer.asFunction<Sum>();
  print('3 + 5 = ${sum(3, 5)}');
}
