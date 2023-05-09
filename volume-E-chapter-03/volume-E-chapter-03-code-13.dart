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
        body: Row(mainAxisSize: MainAxisSize.min, children: [
          Image.network(
              'https://storage.googleapis.com/cms-storage-bucket/780e0e64d323aad2cdd5.png',
              width: 20, height: 20),
          Image.network(
              'https://storage.googleapis.com/cms-storage-bucket/780e0e64d323aad2cdd5.png',
              width: 20, height: 20),
          Image.network(
              'https://storage.googleapis.com/cms-storage-bucket/780e0e64d323aad2cdd5.png',
              width: 20, height: 20),
        ]),
      ),
    );
  }
}
