import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final callback;

  const AuthInput({
    Key key,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      onChanged: (newText) { 
          callback(newText);
        },
      decoration: InputDecoration(
        fillColor: Colors.black,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xeeffffff)),
        isDense: true,
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
