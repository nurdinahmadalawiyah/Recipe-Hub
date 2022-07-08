import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/components/button_large.dart';
import 'package:recipe_hub/utils/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset("assets/images/welcome.jpg"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome to Recipe Hub",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Recipe Hub is a platform for you to search and share your recipes with the world",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: darkgreyColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Let's join with us",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonLarge(
                onPressed: () {},
                size: size,
                text: "Login",
                backgroundColor: primaryColor,
                textColor: whiteColor,
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonLarge(
                onPressed: () {},
                size: size,
                text: "Create Account",
                backgroundColor: secondaryColor,
                textColor: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
