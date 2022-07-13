import 'package:flutter/material.dart';
import 'package:recipe_hub/utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    required this.textInputType,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  final String labelText;
  final IconData prefixIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: primaryColor,
      keyboardType: textInputType,
      decoration: InputDecoration(
        filled: true,
        labelText: labelText,
        labelStyle: const TextStyle(color: primaryColor),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            style: BorderStyle.solid,
            color: primaryColor,
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: primaryColor,
        ),
      ),
    );
  }
}
