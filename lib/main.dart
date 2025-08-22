import 'package:flutter/material.dart';
import 'package:tap_quest/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      home: StartScreen());
  }
}
