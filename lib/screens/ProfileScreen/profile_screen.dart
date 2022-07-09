import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/components/button_medium.dart';
import 'package:recipe_hub/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  "https://jalakasih.com/assets/frontend/images/resource/256-512.png"),
              backgroundColor: primaryColor,
            ),
            const SizedBox(height: 20),
            Text(
              "Nurdin A. Alawiyah",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "nurdinahmada@gmail.com",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: darkgreyColor,
              ),
            ),
            const SizedBox(height: 20),
            ButtonMedium(
              size: size,
              text: "Write Recipe",
              backgroundColor: primaryColor,
              textColor: whiteColor,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
