import '../utils/constants.dart';
import 'package:country_quiz/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country quiz',
      theme: ThemeData(
        primaryColor: primary,
        fontFamily: 'Inter',
      ),
      home: const Home(),
    );
  }
}
