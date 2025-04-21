import 'package:chat_agent/models/agent_model.dart';
import 'package:chat_agent/models/chat_message_model.dart';
import 'package:chat_agent/services/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ControllerService extends GetxController {
  final TextEditingController textcontroller = TextEditingController();
  RxList<Agent> agents = <Agent>[].obs;
  RxList<ChatMessage> messages = <ChatMessage>[].obs;
  String fname = "";

  void createAgent(String name, String role) async {
    fname = name;
    final newAgent = Agent(
      id: const Uuid().v4(),
      name: name,
      persona: role,
    );
    agents.add(newAgent);
  }

  void sendMessage() async {
    final text = textcontroller.text;
    if (text.trim().isEmpty) return;

    final userMessage =
        ChatMessage(message: text, isUser: true, timestamp: DateTime.now());
    messages.add(userMessage);
    textcontroller.clear();

    final botResponse = await ChatService.getResponse(fname, messages);
    messages.add(botResponse);
  }
}
