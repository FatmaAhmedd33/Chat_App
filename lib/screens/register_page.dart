import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Form(
            key: formKey,
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
                CustomFormTextField(
                    onchange: (data) {
                      email = data;
                    },
                    text: 'Email'),
                const SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
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
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {
                        //to update ui
                      });

                      try {
                        await resigterUser();
                        showSnackBar(context, 'your registertion is successed');
                        Navigator.pushNamed(context, ChatPage.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        showSnackBar(context, e.toString());
                      }
                      isLoading = false;
                      setState(() {
                        //to update ui
                      });
                    } else {}
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
        ),
      ),
    );
  }

  Future<void> resigterUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
