import 'dart:developer';

import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static String id = 'RegisterPage';
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/pngwing.com.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'ScholarChat',
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                //wrap this text in row to make it in the defult of row in thwe start of page
                Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
                onchange: (data) {
                  email = data;
                },
                text: 'Email'),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                onchange: (data) {
                  password = data;
                },
                text: 'Password'),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              ontap: () async {
                //var auth = FirebaseAuth.instance; you can you the instant directly instead of create object
                try {
                  await resigterUser();
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    showSnackBar(context, 'The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    showSnackBar(
                        context, 'The account already exists for that email.');
                  }
                } catch (e) {
                  showSnackBar(context, e.toString());
                }
                showSnackBar(context, 'your registertion is successed');
              },
              text: 'register ',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "already have an account? ",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    //make pop bec navigator build screens over the last screen
                    //if i make all push i will get more than
                    // two screens builded and that will destory my app
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'login',
                    style: TextStyle(color: Color(0xff5AB4BD)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> resigterUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
