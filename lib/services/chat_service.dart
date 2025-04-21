import 'package:chat_agent/models/chat_message_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatService {
  static final model = GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: 'AIzaSyB6-A-HxtUva55H5ELq7Ivr64PmIKkbXy0');

  static Future<ChatMessage> getResponse(
      String name, List<ChatMessage> history) async {
    final chat = model.startChat();

    // Include history in prompt
    final prompt = StringBuffer();
    prompt.writeln('You are ${name}, a virtual assistant.');

    prompt.writeln('Conversation so far:');
    for (var msg in history) {
      prompt.writeln(
          msg.isUser ? 'User: ${msg.message}' : '${name}: ${msg.message}');
    }

    // Send to Gemini
    final content = Content.text(prompt.toString());
    final response = await chat.sendMessage(content);

    final replyText = response.text ?? 'Sorry, I couldn’t generate a response.';

    final chatMessage = ChatMessage(
      message: replyText.trim(),
      isUser: false,
      timestamp: DateTime.now(),
    );

    return chatMessage;
  }
}
