void main() {
  int iTemp1 = 1;
  int iTemp2 = 0;
  int iResult1 = 0;

  try {
    iResult1 = iTemp1 ~/ iTemp2;
  } catch (error) {
    print(error);
  }

  print("result is $iResult1");
}
