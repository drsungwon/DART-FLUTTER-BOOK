void main() {
  num number1, number2;
  num tmp1, tmp2, tmp3, tmp4, tmp5, tmp6;

  number1 = 3;
  number2 = 2;

  tmp1 = number1 + number2;
  tmp2 = number1 - number2;
  tmp3 = number1 * number2;
  tmp4 = number1 / number2;
  tmp5 = number1 ~/ number2;
  tmp6 = number1 % number2;

  print('[1] $tmp1 $tmp2 $tmp3 $tmp4 $tmp5 $tmp6');

  number1 = 3.0;
  number2 = 2;

  tmp1 = number1 + number2;
  tmp2 = number1 - number2;
  tmp3 = number1 * number2;
  tmp4 = number1 / number2;
  tmp5 = number1 ~/ number2;
  tmp6 = number1 % number2;

  print('[2] $tmp1 $tmp2 $tmp3 $tmp4 $tmp5 $tmp6');

  number1 = 3;
  number2 = 3;

  num number3, number4;

  number3 = ++number1 + 1;
  number4 = number2++ + 1;

  print('[3] $number3 $number4');

  number1 = 3;
  number2 = 3;

  number3 = --number1 + 1;
  number4 = number2-- + 1;

  print('[4] $number3 $number4');

  number1 = 3;
  number1 += 1;
  print('[5] $number1');

  number1 = 3;
  number1 -= 1;
  print('[6] $number1');

  number1 = 3;
  number1 *= 2;
  print('[7] $number1');

  number1 = 6;
  number1 ~/= 2;
  print('[8] $number1');

  number1 = 7;
  number1 %= 2;
  print('[9] $number1');
}
