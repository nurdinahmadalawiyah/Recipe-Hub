import 'package:flutter/material.dart';
import 'package:recipe_hub/components/text_field_widget.dart';

class InputFormEmail extends StatelessWidget {
  const InputFormEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: const TextFieldWidget(
        labelText: 'Email',
        prefixIcon: Icons.email_rounded,
      ),
    );
  }
}