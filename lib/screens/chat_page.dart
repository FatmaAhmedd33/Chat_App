import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  
  static String id = 'ChatPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          children: [
            Image.asset('assets/images/scholar.png'),
            const Text('chat')
          ],
        ),
      ),
    );
  }
}
