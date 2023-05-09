import 'dart:html';
import 'dart:core';

void main() async {
  final header = querySelector('#target');
  header?.text = "Ready?";
  await Future.delayed(Duration(seconds: 2), () => {});

  for (var count = 5; count > 0; count--) {
    header?.text = "$count";
    await Future.delayed(Duration(seconds: 1), () => {});
  }

  header?.text = "F.I.R.E.!";
}
