import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String boardName;

  ChatPage({required this.boardName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(boardName)),
      body: Center(child: Text('Chat for $boardName')),
    );
  }
}
