import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key, required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: kPrimaryColor,
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
