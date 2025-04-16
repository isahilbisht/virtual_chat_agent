import 'package:chat_agent/models/agent_model.dart';
import 'package:chat_agent/widgets/agent_card.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Agent> agents = [];

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
              final newAgent = Agent(
                id: const Uuid().v4(),
                name: name,
                persona: persona,
              );
              setState(() => agents.add(newAgent));
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
      body: ListView.builder(
        itemCount: agents.length,
        itemBuilder: (ctx, i) => AgentCard(
          agent: agents[i],
          onTap: () =>
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createAgent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
