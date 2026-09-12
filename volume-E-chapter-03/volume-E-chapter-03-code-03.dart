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
        body: Center(
          child: Image.network(
            'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
