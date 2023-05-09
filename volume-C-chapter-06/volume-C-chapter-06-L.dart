void main() {
  var tmpList = [0, 1];
  var tmpInt = 0;
  try {
    tmpInt = tmpList[2];
  } catch (error) {
    print("catch is $error");
  }
  print("tmpInt is $tmpInt");
}
