import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  //if this colection exist give collection refrence if not exist ,will create it then give refreance
  //so if i write the name of collection wrong will create another collection so will take name of collection as a constant
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: messages.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.docs[1]
                ['message']); // to make sure i access the data
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
                        controller:
                            controller, //to clear text field after send message
                        onSubmitted: (value) {
                          messages.add({'message': value});
                          controller.clear();
                        },
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
          } else {
            return Text('loading ...');
          }
        });
  }
}
