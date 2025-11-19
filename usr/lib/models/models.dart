class User {
  final String id;
  final String name;
  final String avatarUrl;
  final String status;

  User({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.status = 'Offline',
  });
}

class Message {
  final String id;
  final User sender;
  final String time;
  final String text;
  final bool isMe;
  final bool isRead;

  Message({
    required this.id,
    required this.sender,
    required this.time,
    required this.text,
    required this.isMe,
    this.isRead = false,
  });
}
