import 'package:chat_agent/screens/chat_screen.dart';
import 'package:chat_agent/services/controller_service.dart';
import 'package:chat_agent/widgets/agent_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ControllerService _controllerService = Get.put(ControllerService());

  void _createAgent() async {
    String name = '';
    String persona = '';
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Create Agent'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (val) => name = val,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Persona'),
              onChanged: (val) => persona = val,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _controllerService.createAgent(name, persona);
              Navigator.of(ctx).pop();
            },
            child: const Text('Create'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agents')),
      body: Obx(() => ListView.builder(
            itemCount: _controllerService.agents.length,
            itemBuilder: (ctx, i) => AgentCard(
              agent: _controllerService.agents[i],
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      ChatScreen(agent: _controllerService.agents[i]),
                ),
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _createAgent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
