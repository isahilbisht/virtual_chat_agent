class Agent {
  final String id;
  final String name;
  final String persona;

  Agent({
    required this.id,
    required this.name,
    required this.persona,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'persona': persona,
      };

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        id: json['id'],
        name: json['name'],
        persona: json['persona'],
      );
}
