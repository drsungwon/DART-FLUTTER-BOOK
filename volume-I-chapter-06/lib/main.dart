import 'package:web/web.dart' as web;

Future<void> main() async {
  final target = web.document.querySelector('#target');

  if (target == null) {
    throw StateError('#target 요소를 찾을 수 없습니다.');
  }

  target.textContent = 'Ready?';
  await Future<void>.delayed(const Duration(seconds: 2));

  for (var count = 5; count > 0; count--) {
    target.textContent = '$count';
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  target.textContent = 'F.I.R.E.!';
}
