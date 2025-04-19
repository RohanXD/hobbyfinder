import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final GenerativeModel _model;

  GeminiService(String apiKey)
      : _model = GenerativeModel(
    model: 'gemini-2.0-flash', // Use the same model name here!
    apiKey: apiKey,
  );

  Future<String> generateHobbySuggestions(String answers, List<String> matchedHobbies) async {
    final prompt = '''
User answered the following questions:
$answers

Based on the answers, suggest the 3 most suitable hobbies from this list: ${matchedHobbies.join(', ')}.
    ''';

    try {
      final response = await _model.generateContent([
        Content.text(prompt),
      ]);

      return response.text?.trim() ?? "No suggestions found.";
    } catch (e) {
      return "Error: ${e.toString()}";
    }
  }
}
