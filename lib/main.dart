import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/login_page.dart';
import 'package:chat_app/screens/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
/*we want to navigator screen we write a long code we can ,ake it easier by using 
navigator.push named() take to varible context name route
route name this a string we link it to the widget screen that we want to push 
so we go to material app choose attribute routes give it map of string and widget builder 
and in this case use intial builder instand of home*/
      routes: {
        // i face problem if i write name of string uncorrect will give me exception so
        //i will go to class of page create static string then access it
        RegisterPage.id: (context) => RegisterPage(),
        LoginPage.id: (context) => LoginPage(),
        ChatPage.id: (context) =>  ChatPage()
      },
      initialRoute: LoginPage.id,
      debugShowCheckedModeBanner: false,
    );
  }
}
