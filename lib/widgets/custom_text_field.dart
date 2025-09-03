import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.width,
    this.validatorFunc,
    this.onClick
  });

  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final double? width;
  final String? Function(String?)? validatorFunc;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: Container(
        width: width,
        child: TextFormField(
          onTap: onClick,
          validator: validatorFunc,
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
