import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      body: Column(
          //will throw exception bec listview in side the column do to solve this problem wrap histview whit expanded widget
          children: [
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return ChatBubble();
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'send message',
                    suffixIcon: Icon(
                      Icons.send,
                      color: kPrimaryColor,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(12))),
              ),
            )
          ]),
    );
  }
}
