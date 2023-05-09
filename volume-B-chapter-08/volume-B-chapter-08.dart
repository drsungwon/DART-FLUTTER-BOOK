// Type.1 Normal Function
int getMax(var argv1, var argv2) {
  if (argv1 >= argv2) {
    return argv1;
  } else {
    return argv2;
  }
}

// Type.2 Shorthand Syntax Function
int getSum(var argv1, var argv2) => argv1 + argv2;

// Type.3 Named Parameters
int getMaxNamed({var argv1, var argv2}) {
  if (argv1 >= argv2) {
    return argv1;
  } else {
    return argv2;
  }
}

// Type.4 Optional and Default Parameters in Normal Function
int getMaxDefault(var argv1, [var argv2 = 1]) {
  if (argv1 >= argv2) {
    return argv1;
  } else {
    return argv2;
  }
}

// Type.5 Optional and Default Parameters in Named Parameters
int getMaxNamedDefault({var argv1, var argv2 = 1}) {
  // [WARN] Protected code for local variables check
  // print(tmp1, tmp2, tmp3);

  if (argv1 >= argv2) {
    return argv1;
  } else {
    return argv2;
  }
}

void main() {
  var tmp1 = 3;
  var tmp2 = 2;
  var tmp3 = 0;

  tmp3 = getMax(tmp1, tmp2);
  print("getMax(3,2) ==> $tmp3");

  tmp3 = getSum(tmp1, tmp2);
  print("getSum(3,2) ==> $tmp3");

  tmp3 = getMaxNamed(argv1: tmp1, argv2: tmp2);
  print("getMaxNamed(argv1: 3, argv2: 2) ==> $tmp3");

  tmp3 = getMaxDefault(tmp1);
  print("getMaxDefault(3) ==> $tmp3");

  tmp3 = getMaxNamedDefault(argv1: tmp1);
  print("getMaxNamedDefault(argv1: 3) ==> $tmp3");

  // [WARN] Protected code for local variables check
  // print(argv1, argv2);
}
