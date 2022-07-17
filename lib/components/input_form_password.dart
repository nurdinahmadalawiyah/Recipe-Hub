import 'package:flutter/material.dart';
import 'package:recipe_hub/components/text_field_widget.dart';

class InputFormPassword extends StatelessWidget {
  const InputFormPassword({
    Key? key,
    required this.labelText, required this.controller,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: TextFieldWidget(
        labelText: labelText,
        prefixIcon: Icons.lock_rounded,
        maxLines: 1,
        textInputType: TextInputType.visiblePassword,
        obscureText: true, controller: controller,
      ),
    );
  }
}
