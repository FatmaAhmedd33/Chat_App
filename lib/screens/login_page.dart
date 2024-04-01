import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff274460),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Image.asset(
              'assets/images/pngwing.com.png',
              height: 100,
              width: 100,
            ),
            const Text(
              'ScholarChat',
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
            const Spacer(
              flex: 2,
            ),
            const Row(
              children: [
                //wrap this text in row to make it in the defult of row in thwe start of page
                Text(
                  'sign in',
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
            const CustomButton(),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "don't have an account? ",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'register',
                  style: TextStyle(color: Color(0xff5AB4BD)),
                ),
              ],
            ),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
