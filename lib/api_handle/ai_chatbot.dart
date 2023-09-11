import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIChatbot {
  final String apiKey;
  final String apiUrl = 'https://api.openai.com/v1/engines/davinci/completions';

  OpenAIChatbot({required this.apiKey});

  Future<String> getChatbotReply(String input) async {
    final headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'prompt': input,
      'max_tokens': 100,
      // Add any other parameters specific to your chatbot implementation
    });

    final response = await http.post(Uri.parse(apiUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['text'];
    } else {
      throw Exception('Failed to get response from the chatbot API.');
    }
  }
}
