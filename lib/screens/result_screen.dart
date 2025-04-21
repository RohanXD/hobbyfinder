import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String hobbies;

  const ResultScreen({super.key, required this.hobbies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Recommended Hobbies")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          hobbies,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}