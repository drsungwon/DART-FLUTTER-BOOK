void main() {
  int iTemp1 = 1;
  int iTemp2 = 0;
  int iResult1 = 0;

  try {
    iResult1 = calcSomething(iTemp1, iTemp2);
  } catch (error) {
    print("catch: un-known error");
  } finally {
    print("finally: result is $iResult1");
  }
}

int calcSomething(int iLeft, int iRight) {
  int iResult = 0;

  try {
    iResult = iLeft ~/ iRight;
  } on UnsupportedError {
    print("on UnsupportedError@calcSomething: iRight is 0");
    iRight = 1;
    print("on UnsupportedError@calcSomething: iRight = 1 and re-try");
    iResult = iLeft ~/ iRight;
  } catch (error) {
    print("catch@calcSomething: un-known error");
  }

  return iResult;
}
