import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/components/button_large.dart';
import 'package:recipe_hub/screens/LoginScreen/login_screen.dart';
import 'package:recipe_hub/screens/RegisterScreen/register_screen.dart';
import 'package:recipe_hub/screens/WelcomeScreen/components/welcome_desc.dart';
import 'package:recipe_hub/screens/WelcomeScreen/components/welcome_image.dart';
import 'package:recipe_hub/screens/WelcomeScreen/components/welcome_title.dart';
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
              const WelcomeImage(),
              const SizedBox(height: 20),
              const WelcomTitle(),
              const SizedBox(height: 20),
              const WelcomeDesc(),
              const SizedBox(height: 100),
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
              const SizedBox(height: 20),
              ButtonLarge(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen(),
                    ),
                  );
                },
                size: size,
                text: "Login",
                backgroundColor: primaryColor,
                textColor: whiteColor,
              ),
              const SizedBox(height: 15),
              ButtonLarge(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const RegisterScreen(),
                    ),
                  );
                },
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
