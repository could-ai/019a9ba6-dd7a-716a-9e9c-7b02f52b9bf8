import 'package:flutter/material.dart';
import '../models/models.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  // Mock Data
  final List<User> _recentChats = [
    User(id: '1', name: '张三', avatarUrl: 'https://i.pravatar.cc/150?u=1', status: 'Online'),
    User(id: '2', name: '李四', avatarUrl: 'https://i.pravatar.cc/150?u=2', status: 'Offline'),
    User(id: '3', name: '王五', avatarUrl: 'https://i.pravatar.cc/150?u=3', status: 'Online'),
    User(id: '4', name: '赵六', avatarUrl: 'https://i.pravatar.cc/150?u=4', status: 'Busy'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消息'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _recentChats.length,
        itemBuilder: (context, index) {
          final user = _recentChats[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
            title: Text(
              user.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              '最近的一条消息内容...',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey[600]),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '12:30',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                if (index == 0)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(user: user),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
