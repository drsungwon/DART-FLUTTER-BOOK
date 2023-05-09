void main() {
  var number1 = 1;
  var number2 = 1;
  var number3 = 2;

  print("[ 1] $number1 == $number2 : ${number1 == number2}");
  print("[ 2] $number1 == $number3 : ${number1 == number3}");
  print("[ 3] $number1 != $number2 : ${number1 != number2}");
  print("[ 4] $number1 != $number3 : ${number1 != number3}");
  print("[ 5] $number1 >= $number2 : ${number1 >= number2}");
  print("[ 6] $number1 <= $number2 : ${number1 <= number2}");
  print("[ 7] $number1 >  $number2 : ${number1 > number2}");
  print("[ 8] $number1 <  $number2 : ${number1 < number2}");
  print("[ 9] $number1 >= $number3 : ${number1 >= number3}");
  print("[10] $number1 <= $number3 : ${number1 <= number3}");
  print("[11] $number1 >  $number3 : ${number1 > number3}");
  print("[12] $number1 <  $number3 : ${number1 < number3}");

  var flag1 = ((number1 == number2) || (number1 == number3));
  bool flag2 = ((number1 == number2) && (number1 == number3));

  print("[13] ($number1 == $number2) OR  ($number1 == $number3) : $flag1");
  print("[14] ($number1 == $number2) AND ($number1 == $number3) : $flag2");
  print("[15] NOT ($number1 == $number2) : ${!(number1 == number2)}");

  if (number1 == number2) {
    print("[16] (a) number1[$number1] equal to number2[$number2].");
  } else if (number1 == number3) {
    print("[16] (b) number1[$number1] equal to number3[$number3].");
  } else {
    print("[16] (c) number1[$number1] not equal to number2[$number2] and number3[$number3].");
  }

  var switchStatus = 'OFF';

  switch (switchStatus) {
    case 'OFF':
      print("[17] (a) switch is OFF.");
      break;
    case 'ON':
      print("[17] (b) switch is ON.");
      break;
    default:
      print("[17] (c) switch status is not correct.");
      break;
  }

  switch (switchStatus) {
    case 'off':
    case 'OFF':
      print("[18] (a) switch is OFF.");
      break;
    case 'on':
    case 'ON':
      print("[18] (b) switch is ON.");
      break;
    default:
      print("[18] (c) switch status is not correct.");
      break;
  }

  var programTermination = 'NORMAL';

  assert(programTermination == 'NORMAL');
  print("[19] program terminated in normal.");
}
