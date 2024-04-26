import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/register_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            const SizedBox(height: 20,),
            const Center(
              child:  Text(
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
                  'sign in',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
             CustomTextField(text: 'Email'),
            const SizedBox(
              height: 10,
            ),
             CustomTextField(text: 'Password'),
            const SizedBox(
              height: 20,
            ),
             CustomButton(
              text: 'login',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "don't have an account? ",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterPage.id);
                  },
                  child: const Text(
                    'register',
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
