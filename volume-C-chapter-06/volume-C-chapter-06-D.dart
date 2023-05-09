void main() {
  int iTemp1 = 1;
  int iTemp2 = 0;
  int iResult1 = 0;

  try {
    iResult1 = iTemp1 ~/ iTemp2;
  } catch (error) {
    print("catch: $error");
    iTemp2 = 1;
    print("catch: iTemp2 = 1 and re-try");
    iResult1 = iTemp1 ~/ iTemp2;
  }

  print("result is $iResult1");
}
