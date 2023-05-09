import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:isolate';
import 'package:async/async.dart';

void main() async {
  int counter = 5;
  await for (final msg in _sendAndReceive(counter)) {
    print('Received from _sendAndReceive(): < $msg >');
  }
}

Stream<String> _sendAndReceive(int counter) async* {
  final p = ReceivePort();
  await Isolate.spawn(_doCount, p.sendPort);
  final events = StreamQueue<dynamic>(p);
  SendPort sendPort = await events.next;
  for (var temp = counter; temp >= 0; temp--) {
    sendPort.send(temp);
    String message = await events.next;
    yield message;
  }
  sendPort.send(null);
  await events.cancel();
}

Future<void> _doCount(SendPort p) async {
  print('Isolate _doCount() started.');
  final commandPort = ReceivePort();
  p.send(commandPort.sendPort);
  await for (final message in commandPort) {
    if (message is int) {
      await Future.delayed(Duration(seconds: 1), () => {});
      final contents = "_doCount(): $message seconds";
      p.send(contents);
    } else if (message == null) {
      break;
    }
  }
  print('Isolate _doCount() completed.');
  Isolate.exit();
}
