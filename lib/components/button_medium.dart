import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/utils/colors.dart';

class ButtonMedium extends StatelessWidget {
  const ButtonMedium({
    Key? key,
    required this.size,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(
        Icons.edit,
        color: whiteColor,
      ),
      style: ElevatedButton.styleFrom(primary: primaryColor, padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
      label: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
