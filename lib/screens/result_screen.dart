import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String hobbies;

  const ResultScreen({super.key, required this.hobbies});

  // Helper to extract hobbies and reasoning
  List<Map<String, String>> parseHobbyDetails(String hobbyText) {
    final hobbySections = hobbyText.split('\n\n');
    List<Map<String, String>> results = [];

    for (final section in hobbySections) {
      final lines = section.trim().split('\n');
      if (lines.length >= 2) {
        final title = lines[0].replaceAll(RegExp(r'^[-*]\s*'), '');
        final description = lines.sublist(1).join('\n');
        results.add({'title': title, 'description': description});
      }
    }

    return results;
  }

  @override
  Widget build(BuildContext context) {
    final hobbyList = parseHobbyDetails(hobbies);

    return Scaffold(
      appBar: AppBar(title: const Text("Your Recommended Hobbies")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              "Based on your answers:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Display plain answers text
            Text(
              hobbies.split('Hobbies:').first.trim(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const Text(
              "Recommended Hobbies:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Display hobbies in expandable cards
            ...hobbyList.map((hobby) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ExpansionTile(
                  title: Text(
                    hobby['title'] ?? '',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        hobby['description'] ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
