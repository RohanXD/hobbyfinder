import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class ChatGPTService {
  final OpenAI openAI;

  ChatGPTService(String apiKey)
      : openAI = OpenAI.instance.build(
    token: apiKey,
    baseOption: HttpSetup(receiveTimeout: Duration(milliseconds: 60000)),
  );

  Future<String> generateHobbySuggestions(String answers, List<String> matchedHobbies) async {
    final request = ChatCompleteText(
      model: Gpt4ChatModel(),
      messages: [
        Messages(role: Role.system, content: "You are an AI hobby recommender").toJson(),
        Messages(role: Role.user, content: "User answered:\n$answers\nSuggest hobbies from this list:\n${matchedHobbies.join(', ')}").toJson(),
      ],
    );

    try {
      final response = await openAI.onChatCompletion(request: request);
      return response?.choices?.first?.message?.content ?? matchedHobbies.join(', ');
    } catch (e) {
      return "Error: ${e.toString()}";
    }
  }
}