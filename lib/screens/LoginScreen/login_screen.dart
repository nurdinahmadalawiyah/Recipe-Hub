import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/components/button_large.dart';
import 'package:recipe_hub/screens/LoginScreen/components/input_form_email.dart';
import 'package:recipe_hub/screens/LoginScreen/components/input_form_password.dart';
import 'package:recipe_hub/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Container(
          width: double.infinity,
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
                    "Welcome Back!",
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
                    "Login ",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    "Now.",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const InputFormEmail(),
              const SizedBox(height: 20),
              const InputFormPassword(),
              const SizedBox(height: 50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.3),
                child: ButtonLarge(
                  size: size,
                  text: 'Login',
                  backgroundColor: primaryColor,
                  textColor: whiteColor,
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "If you are new here, ",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: darkgreyColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Create account',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
