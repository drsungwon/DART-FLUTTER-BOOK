import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    return MaterialApp(
      title: 'App Title',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar Title'),
        ),
        body: Center(
          child: Image.network(
            'https://storage.googleapis.com/cms-storage-bucket/780e0e64d323aad2cdd5.png',
//          'https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png',
//          'https://storage.googleapis.com/cms-storage-bucket/4cdf1c5482cd30174cfe.png',
          ),
        ),
      ),
    );
  }
}
