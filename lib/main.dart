import 'package:flutter/material.dart';
import 'package:unichat/Intro/Introduction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unichat',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Intro(), // Set your home page widget as the initial screen
    );
  }
}
