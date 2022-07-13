import 'package:flutter/material.dart';
import 'package:recipe_hub/components/text_field_widget.dart';

class InputFormEmail extends StatelessWidget {
  const InputFormEmail({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: TextFieldWidget(
        labelText: 'Email',
        prefixIcon: Icons.email_rounded,
        textInputType: TextInputType.emailAddress,
        obscureText: false,
        controller: controller,
      ),
    );
  }
}
