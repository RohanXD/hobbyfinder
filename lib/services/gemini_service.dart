import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final String apiKey;

  GeminiService(this.apiKey);

  Future<String> generateHobbySuggestions(String answers, List<String> matchedHobbies) async {
    final prompt = "User answered:\n$answers\nSuggest hobbies from this list:\n${matchedHobbies.join(', ')}";

    try {
      // Use gemini-2.0-flash model
      final model = GenerativeModel(
        model: 'gemini-2.0-flash',
        apiKey: apiKey,
      );

      final response = await model.generateContent([
        Content.text(prompt),
      ]);

      final text = response.text;

      if (text != null && text.isNotEmpty) {
        return text;
      } else {
        return "No relevant hobbies found. Try adjusting your answers.";
      }
    } catch (e) {
      return "Error: ${e.toString()}";
    }
  }
}
