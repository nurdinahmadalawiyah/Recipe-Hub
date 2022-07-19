import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/components/button_large.dart';
import 'package:recipe_hub/components/failed_auth_dialog.dart';
import 'package:recipe_hub/components/input_form_email.dart';
import 'package:recipe_hub/components/input_form_password.dart';
import 'package:recipe_hub/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Timer _timer;

  void _validasiLogin() async {
    if (emailController.text == "" && passwordController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          content: Text(
            'Email and Password cannot be empty',
            textAlign: TextAlign.center,
          ),
          backgroundColor: darkgreyColor,
        ),
      );
      return;
    }
    showLoaderDialog(context, 30);
    final response = await http.post(
        Uri.parse("https://recipe-hub-backend.herokuapp.com/api/login"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text
        }));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("access_token", json.encode(data['access_token']));
      await pref.setString("id", json.encode(data['id']));
      setState(() {
        Navigator.pushReplacementNamed(context, 'main');
      });
    } else {
      setState(() {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (BuildContext content) => const FailedAuthDialog(
              title: 'Login Failed!',
              content: 'Wrong email or password entered \nPlease try again!'),
        );
      });
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
                Navigator.pushNamed(context, 'register');
              },
              child: Text(
                'Create account',
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
              InputFormEmail(
                controller: emailController,
              ),
              const SizedBox(height: 20),
              InputFormPassword(
                controller: passwordController,
                labelText: 'Password',
              ),
              const SizedBox(height: 50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.3),
                child: ButtonLarge(
                  size: size,
                  text: 'Login',
                  backgroundColor: primaryColor,
                  textColor: whiteColor,
                  onPressed: () {
                    _validasiLogin();
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
