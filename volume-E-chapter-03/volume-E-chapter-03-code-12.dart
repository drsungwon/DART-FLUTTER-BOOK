import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Title',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar Title'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              'https://docs.flutter.dev/assets/images/dash/early-dash-sketches5.jpg',
              width: 100,
              height: 100,
            ),
            Image.network(
              'https://docs.flutter.dev/assets/images/dash/early-dash-sketches5.jpg',
              width: 100,
              height: 100,
            ),
            Image.network(
              'https://docs.flutter.dev/assets/images/dash/early-dash-sketches5.jpg',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
