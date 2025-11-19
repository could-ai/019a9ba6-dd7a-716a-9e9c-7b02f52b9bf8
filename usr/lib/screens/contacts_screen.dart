import 'package:flutter/material.dart';
import '../models/models.dart';
import 'chat_screen.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<User> contacts = [
      User(id: '1', name: '张三', avatarUrl: 'https://i.pravatar.cc/150?u=1'),
      User(id: '2', name: '李四', avatarUrl: 'https://i.pravatar.cc/150?u=2'),
      User(id: '3', name: '王五', avatarUrl: 'https://i.pravatar.cc/150?u=3'),
      User(id: '4', name: '赵六', avatarUrl: 'https://i.pravatar.cc/150?u=4'),
      User(id: '5', name: '钱七', avatarUrl: 'https://i.pravatar.cc/150?u=5'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('联系人'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final user = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
            title: Text(
              user.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
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
