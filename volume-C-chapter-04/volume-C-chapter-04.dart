/*
 * Example 1 : Without Generic Class

class Point_int {
  late int x;
  late int y;
  Point_int(int givenX, int givenY) : x = givenX, y = givenY;
}

class Point_double {
  late double x;
  late double y;
  Point_double(double givenX, double givenY) : x = givenX, y = givenY;
}

class Point_String {
  late String x;
  late String y;
  Point_String(String givenX, String givenY) : x = givenX, y = givenY;
}

void main() {
  Point_int iPoint = Point_int(10,10);
  print("${iPoint.runtimeType} => (${iPoint.x},${iPoint.y})");
  
  Point_double dPoint = Point_double(10.1,10.1);
  print("${dPoint.runtimeType} => (${dPoint.x},${dPoint.y})");
  
  Point_String sPoint = Point_String('10.2','10.2');
  print("${sPoint.runtimeType} => (${sPoint.x},${sPoint.y})");
}
 */

class Point<T> {
  late T x;
  late T y;
  Point(T givenX, T givenY)
      : x = givenX,
        y = givenY {
    objCount++;
  }

  static int objCount = 0;
  get cnt => objCount;
}

void main() {
  Point<int> iP1 = Point<int>(10, 10);
  print("${iP1.runtimeType} iP1 => (${iP1.x},${iP1.y}), and cnt(${iP1.cnt})");

  Point<int> iP2 = Point<int>(20, 20);
  print("${iP2.runtimeType} iP2 => (${iP2.x},${iP2.y}), and cnt(${iP2.cnt})");

  Point<double> dP = Point<double>(10.1, 10.1);
  print("${dP.runtimeType} dP => (${dP.x},${dP.y}), and cnt(${dP.cnt})");

  Point<String> sP = Point<String>('10.2', '10.2');
  print("${sP.runtimeType} sP => (${sP.x},${sP.y}), and cnt(${sP.cnt})");
}

/*
 * Example 2 : Generic Class with Two Parameters

class Point<T, Y> {
  late T x;
  late Y y;
  Point(T givenX, Y givenY)
      : x = givenX,
        y = givenY {
    objCount++;
  }

  static int objCount = 0;
  get cnt => objCount;
}

void main() {
  Point<int, double> iP1 = Point<int, double>(10, 10.1);
  print("${iP1.runtimeType} iP1 => (${iP1.x},${iP1.y}), and cnt(${iP1.cnt})");

  Point<int, int> iP2 = Point<int, int>(20, 20);
  print("${iP2.runtimeType} iP2 => (${iP2.x},${iP2.y}), and cnt(${iP2.cnt})");

  Point<double, String> dP = Point<double, String>(10.1, '10.1');
  print("${dP.runtimeType} dP => (${dP.x},${dP.y}), and cnt(${dP.cnt})");

  Point<String, String> sP = Point<String, String>('10.2', '10.2');
  print("${sP.runtimeType} sP => (${sP.x},${sP.y}), and cnt(${sP.cnt})");
}
 */