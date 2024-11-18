import 'package:flutter/material.dart';

class MessageBoardsPage extends StatelessWidget {
  final List<Map<String, String>> boards = [
    {'name': 'General', 'icon': 'assets/general_icon.png'},
    {'name': 'Tech Talk', 'icon': 'assets/tech_icon.png'},
    {'name': 'Sports', 'icon': 'assets/sports_icon.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Message Boards')),
      body: ListView.builder(
        itemCount: boards.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(boards[index]['icon']!),
            title: Text(boards[index]['name']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage(boardName: boards[index]['name']!)),
              );
            },
          );
        },
      ),
    );
  }
}
