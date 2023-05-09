void main() {
  // Variable Case.1
  int intTemp = 1;
  print(intTemp);
  double dblTemp = 2.2;
  print(dblTemp);
  num numIntTemp = 3;
  print(numIntTemp);
  num numDblTemp = 4.4;
  print(numDblTemp);
  String strTemp = "Hello!";
  print(strTemp);

  // Variable Case.2
  var varInt = 1;
  var varDouble = 2.2;
  var varString = "Hello!";
  print("$varInt $varDouble $varString");
  print("RESULT[ $varInt, $varDouble, '$varString' ]");

  // Variable Case.3
  dynamic dynInt = 1;
  dynamic dynDouble = 2.2;
  dynamic dynString = "Hello!";
  print("$dynInt $dynDouble $dynString");

  // Constant Case.1
  const double cMathPi = 3.141592;
  const cChangeRate = 1.3;
  print("$cMathPi $cChangeRate");

  // Constant Case.2
  final String fFirstFruit = "Apple";
  final fSecondFruit = "Mango";
  print("$fFirstFruit $fSecondFruit");
}
