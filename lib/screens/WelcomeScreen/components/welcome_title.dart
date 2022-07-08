import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/utils/colors.dart';

class WelcomTitle extends StatelessWidget {
  const WelcomTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome to Recipe Hub",
      style: GoogleFonts.poppins(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: primaryColor,
      ),
    );
  }
}