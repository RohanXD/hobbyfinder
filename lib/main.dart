import 'package:flutter/material.dart';
import 'package:hobbss/screens/question_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Hobby Recommender',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const QuestionScreen(),
    );
  }
}
