import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false
  });
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,
       horizontal: 50),
      child: Container(
        color: Colors.cyanAccent,
        child: TextField(
          obscureText: isPassword,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: label,
          ),
        ),
      ),
    );
  }
}
