import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ai_assistant/helper/gobal.dart';
import 'package:http/http.dart';

class APIs {
  static Future<String> getAnswer(String question) async {
    try {
      final res =
          await post(Uri.parse('https://api.openai.com/v1/chat/completions'),
              headers: {
                HttpHeaders.contentTypeHeader: 'application/json',
                HttpHeaders.authorizationHeader: 'Bearer $apiKey'
              },
              body: jsonEncode({
                "model": "gpt-3.5-turbo",
                "max_tokens": 2000,
                "temperature": 0,
                "messages": [
                  {"role": "user", "content": question},
                ]
              }));
      final data = jsonDecode(res.body);
      log('res:$data');
      return data['choices'][0]['message']['content'];
    } catch (e) {
      log('getAnswerE:$e');
      return 'Something went wrong(Try again later)';
    }
  }
}
