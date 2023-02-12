import 'package:flutter/material.dart';
import 'package:yt_home/screens/home_tabs.dart';
import 'package:yt_home/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yt_demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const HomeTab(),
    );
  }
}