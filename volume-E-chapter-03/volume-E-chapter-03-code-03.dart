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
        ),
        body: Center(
          child: Image.network(
              'https://storage.googleapis.com/cms-storage-bucket/780e0e64d323aad2cdd5.png',
              width: 100,
              height: 100),
        ),
      ),
    );
  }
}
