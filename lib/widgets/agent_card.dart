import 'package:chat_agent/models/agent_model.dart';
import 'package:flutter/material.dart';

class AgentCard extends StatelessWidget {
  final Agent agent;
  final VoidCallback onTap;

  const AgentCard({super.key, required this.agent, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(agent.name),
      subtitle: Text(agent.persona),
      onTap: onTap,
    );
  }
}
