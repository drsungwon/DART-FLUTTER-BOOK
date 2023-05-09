void main() {
  print("[1] 'for' statement.\n");
  var number = 1;
  var count = 1;
  for (count = 1; count <= 3; count++) {
    print("$number x $count = ${number * count}");
  }

  print("\n[2] 'while' statement.\n");
  number = 1;
  count = 1;
  while (count <= 3) {
    print("$number x $count = ${number * count}");
    count++;
  }

  print("\n[3] 'do-while' statement.\n");
  number = 1;
  count = 1;
  do {
    print("$number x $count = ${number * count}");
    count++;
  } while (count <= 3);

  print("\n[4] nested loop statement.\n");
  for (count = number = 1; number <= 3; number++) {
    while (count <= 3) {
      print("$number x $count = ${number * count}");
      count++;
    }
    count = 1;
  }

  print("\n[5] nested conditional statement.\n");
  for (count = number = 1; number <= 3; number++) {
    if ((number % 9) == 1) {
      while (count <= 3) {
        print("$number x $count = ${number * count}");
        count++;
      }
      count = 1;
    }
  }

  print("\n[6] 'continue' and 'break' statement.\n");
  for (count = number = 1; number <= 9; number++) {
    if (number > 4) {
      print("[6.1] break - $number");
      break;
    } else if ((number % 9) != 1) {
      print("[6.2] continue - $number");
      continue;
    } else {
      print("[6.3] calculate - $number");
      while (count <= 3) {
        print("$number x $count = ${number * count}");
        count++;
      }
      count = 1;
    }
  }
}
