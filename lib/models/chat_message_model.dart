class ChatMessage {
  final String message;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage(
      {required this.message, required this.isUser, required this.timestamp});

  Map<String, dynamic> toJson() => {
        'message': message,
        'isUser': isUser,
        'timestamp': timestamp.toIso8601String(),
      };

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        message: json['message'],
        isUser: json['isUser'],
        timestamp: DateTime.parse(json['timestamp']),
      );
}
