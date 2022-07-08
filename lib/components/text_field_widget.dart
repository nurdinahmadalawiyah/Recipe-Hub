import 'package:flutter/material.dart';
import 'package:recipe_hub/utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
  }) : super(key: key);

  final String labelText;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {},
      cursorColor: primaryColor,
      keyboardType: TextInputType.emailAddress,
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
