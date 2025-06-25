import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:talksy/constants.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final messages = useState<List<Map<String, String>>>(
      [],
    ); // role: user or model

    // Future<void> askDeepSeek(String message) async {
    //   post(
    //     Uri.parse(DEEPSEEK_API_URL),
    //     headers: {
    //       'Content-Type': 'application/json',
    //       'Accept': 'application/json',
    //       'Authorization': 'Bearer $DEEPSEEK_API_KEY',
    //     },
    //     body: jsonEncode({
    //       "model": "deepseek-chat",
    //       "messages": [
    //         {"content": "You are a helpful assistant", "role": "system"},
    //         {"content": message, "role": "user"},
    //       ],
    //     }),
    //   );
    // }

    Future<void> askGemini(String message) async {
      if (message.trim().isEmpty) return;

      // Add user message to chat
      messages.value = [
        ...messages.value,
        {'role': 'user', 'text': message},
      ];

      try {
        final response = await post(
          Uri.parse(GEMINI_API_URL),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "contents": [
              {
                "parts": [
                  {"text": message},
                ],
              },
            ],
          }),
        );

        log(response.body);

        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          final modelReply =
              body['candidates']?[0]?['content']?['parts']?[0]?['text'] ??
              'No response';
          messages.value = [
            ...messages.value,
            {'role': 'model', 'text': modelReply.trim()},
          ];
        } else {
          messages.value = [
            ...messages.value,
            {'role': 'model', 'text': 'Error: ${response.body}'},
          ];
        }
      } catch (e) {
        messages.value = [
          ...messages.value,
          {'role': 'model', 'text': 'Error: $e'},
        ];
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Gemini Chat')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.value.length,
                itemBuilder: (context, index) {
                  final msg = messages.value[index];
                  final isUser = msg['role'] == 'user';
                  return Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.blue[100] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        msg['text'] ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      labelText: 'Type your message',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      textController.clear();
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    await askGemini(textController.text);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
