import 'package:chat_agent/models/agent_model.dart';
import 'package:chat_agent/services/controller_service.dart';
import 'package:chat_agent/widgets/bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  final Agent agent;
  const ChatScreen({super.key, required this.agent});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ControllerService _controllerService = Get.put(ControllerService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.agent.name)),
      body: Column(
        children: [
          Expanded(
              child: Obx(
            () => ListView.builder(
              itemCount: _controllerService.messages.length,
              itemBuilder: (ctx, i) =>
                  MessageBubble(message: _controllerService.messages[i]),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controllerService.textcontroller,
                    decoration:
                        const InputDecoration(hintText: 'Type a message...'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _controllerService.sendMessage();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
