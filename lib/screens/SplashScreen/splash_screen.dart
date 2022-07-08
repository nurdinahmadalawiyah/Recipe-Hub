import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_hub/components/logo_components.dart';
import 'package:recipe_hub/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, 'welcome');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondaryColor,
      body: LogoComponents(size: size),
    );
  }
}
