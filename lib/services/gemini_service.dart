import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final String apiKey;

  GeminiService(this.apiKey);

  Future<String> generateHobbySuggestions(String answers, List<String> matchedHobbies) async {
    final prompt = '''
User's Answers:
$answers

From the following hobbies: ${matchedHobbies.join(', ')}

Please format the response like this for each hobby:

Hobby: [Hobby Name]
Description: [Short description of the hobby]
Reason: [Why this hobby fits the user based on their answers]

Only include hobbies from the list and return 2 to 4 best matches.
''';

    try {
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
