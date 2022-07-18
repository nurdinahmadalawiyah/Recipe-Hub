import 'package:flutter/material.dart';
import 'package:recipe_hub/screens/HomeScreen/home_screen.dart';
import 'package:recipe_hub/screens/SplashScreen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('access_token');
    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = const HomeScreen();
    } else {
      child = const SplashScreen();
    }

    return Scaffold(
      body: child,
    );
  }
}
