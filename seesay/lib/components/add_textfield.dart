import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String labelText;
  final String hintText;
  bool lengthCheck;
  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.lengthCheck = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: lengthCheck ? 50 : null,
      minLines: 1,
      maxLines: 10,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color(0xFFCE4040),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFCE4040),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFCE4040),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0xFFCE4040).withOpacity(0.5),
        ),
      ),
    );
  }
}
