import 'dart:convert';

import 'package:http/http.dart' as http;

import 'chat_model.dart';

class ApiManager {
  static Future<GPTResponce> getGPTResponse(String prompt) async {
    final url = Uri.https('api.openai.com', '/v1/completions');
    String apiKey = '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';

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo-instruct',
        'prompt': prompt,
        'max_tokens': 2000,
        'temperature': 0,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final GPTResponce data = GPTResponce.fromJson(jsonData);
      return data;
    } else {
      throw Exception('Failed to fetch GPT response');
    }
  }
}
