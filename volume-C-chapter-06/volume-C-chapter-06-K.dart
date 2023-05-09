void main() {
  int iTemp1 = 1;
  int iTemp2 = 0;
  int iResult1 = 0;

  try {
    iResult1 = calcSomething(iTemp1, iTemp2);
  } on NegativeDivisorException {
    print("on NegativeDivisorException: iTemp2 is 0");
    iTemp2 = 1;
    print("on NegativeDivisorException: iTemp2 = 1 and re-try");
    iResult1 = iTemp1 ~/ iTemp2;
  } catch (error) {
    print("catch: un-known error");
  } finally {
    print("finally: result is $iResult1");
  }
}

int calcSomething(int iLeft, int iRight) {
  int iResult = 0;

  if (iRight == 0) {
    throw NegativeDivisorException();
  } else {
    iResult = iLeft ~/ iRight;
  }

  return iResult;
}

class NegativeDivisorException implements Exception {
  @override
  String toString() {
    return "Zero divisor is not allowed";
  }
}

//https://dart.dev/guides/language/language-tour#assert
//https://dart.dev/guides/language/language-tour#exceptions