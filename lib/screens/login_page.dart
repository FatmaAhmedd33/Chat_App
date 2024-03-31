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
            Image.asset(
              'assets/images/pngwing.com.png',
              height: 100,
              width: 100,
            ),
            const Text(
              'ScholarChat',
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              'sign in',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const TextField(
                decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: 'Email',
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
            )),
            const SizedBox(
              height: 10,
            ),
            const TextField(
                decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: 'password',
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              border: OutlineInputBorder(borderSide: BorderSide()),
            ))
          ],
        ),
      ),
    );
  }
}
