import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static String id = 'RegisterPage';

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
            const CustomTextField(text: 'Email'),
            const SizedBox(
              height: 10,
            ),
            const CustomTextField(text: 'Password'),
            const SizedBox(
              height: 20,
            ),
            const CustomButton(
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
}
