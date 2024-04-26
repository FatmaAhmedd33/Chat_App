import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({this.onchange,super.key, required this.text});
  final String text;
  Function(String)? onchange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onchange,
        decoration: InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      hintText: text,
      hintStyle: const TextStyle(color: Colors.white),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      border:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    ));
  }
}
