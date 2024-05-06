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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              width: 50,
              height: 50,
            ),
            const Text(
              'chat',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, //to disappear the arrow
      ),
    );
  }
}
