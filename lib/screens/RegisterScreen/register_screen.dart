import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/components/button_large.dart';
import 'package:recipe_hub/components/input_form_email.dart';
import 'package:recipe_hub/components/input_form_password.dart';
import 'package:recipe_hub/components/input_form_username.dart';
import 'package:recipe_hub/utils/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'login');
              },
              child: Text(
                'Login',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hey, ",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    "Welcome to Recipe Hub!",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create ",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    "your account.",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const InputFormUsername(),
              const SizedBox(height: 20),
              const InputFormEmail(),
              const SizedBox(height: 20),
              const InputFormPassword(labelText: 'Password',),
              const SizedBox(height: 20),
              const InputFormPassword(labelText: 'Confirm Password',),
              const SizedBox(height: 50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.3),
                child: ButtonLarge(
                  size: size,
                  text: 'Register',
                  backgroundColor: primaryColor,
                  textColor: whiteColor,
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
