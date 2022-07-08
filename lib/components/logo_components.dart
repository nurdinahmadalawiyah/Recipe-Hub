import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/utils/colors.dart';

class LogoComponents extends StatelessWidget {
  const LogoComponents({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          "assets/icons/logo.svg",
          height: size.height * 0.2,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Recipe ",
              style: GoogleFonts.poppins(
                fontSize: 33,
                fontWeight: FontWeight.w700,
                color: primaryColor,
              ),
            ),
            Text(
              "Hub",
              style: GoogleFonts.poppins(
                fontSize: 33,
                fontWeight: FontWeight.w700,
                color: blackColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
