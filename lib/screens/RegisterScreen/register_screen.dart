import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/components/button_large.dart';
import 'package:recipe_hub/components/input_form_email.dart';
import 'package:recipe_hub/components/input_form_password.dart';
import 'package:recipe_hub/components/input_form_username.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_hub/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  late Timer _timer;

  void _validasiRegister() async {
    if (usernameController.text == "" ||
        emailController.text == "" ||
        passwordController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          content: Text(
            'All fields must be filled with correct data!',
            textAlign: TextAlign.center,
          ),
          backgroundColor: darkgreyColor,
        ),
      );
    } else {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 3),
            content: Text(
              'The password you entered is not the same!',
              textAlign: TextAlign.center,
            ),
            backgroundColor: darkgreyColor,
          ),
        );
      } else {
        showLoaderDialog(context, 5);
        final response = await http
            .post(Uri.parse("https://recipe-hub-backend.herokuapp.com/api/register"), body: {
          "name": usernameController.text,
          "email": emailController.text,
          "password": passwordController.text
        });
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString(
              "access_token", json.encode(data['access_token']));
          await pref.setString("id", json.encode(data['id']));
          setState(() {
            Navigator.pushReplacementNamed(context, 'home');
          });
        }
        print(response.body);
      }
    }
  }

  showLoaderDialog(BuildContext context, int period) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Loading...",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        _timer = Timer(Duration(seconds: period), () {
          Navigator.of(context).pop();
        });
        return alert;
      },
    ).then((value) => {
          if (_timer.isActive) {_timer.cancel()}
        });
  }

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
              InputFormUsername(
                controller: usernameController,
              ),
              const SizedBox(height: 20),
              InputFormEmail(
                controller: emailController,
              ),
              const SizedBox(height: 20),
              InputFormPassword(
                labelText: 'Password',
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              InputFormPassword(
                controller: confirmPasswordController,
                labelText: 'Confirm Password',
              ),
              const SizedBox(height: 50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.3),
                child: ButtonLarge(
                  size: size,
                  text: 'Register',
                  backgroundColor: primaryColor,
                  textColor: whiteColor,
                  onPressed: () {
                    // registerSubmit(context);
                    _validasiRegister();
                  },
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
