import 'package:flutter/material.dart';

void main() {
  runApp(
    const Center(
      child: Text(
        'Hello, World!',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 32,
          color: Colors.white,
        ),
      ),
    ),
  );
}
