import 'package:chat_agent/models/chat_message_model.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.indigo[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(message.message),
      ),
    );
  }
}
