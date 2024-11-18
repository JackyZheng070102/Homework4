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
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Menu')),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: boards.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(boards[index]['icon']!),
            title: Text(boards[index]['name']!),
            onTap: () {
              Navigator.pushNamed(context, '/chat', arguments: {'boardName': boards[index]['name']!});
            },
          );
        },
      ),
    );
  }
}
