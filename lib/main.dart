import 'package:flutter/material.dart';
import 'package:recipe_hub/screens/SplashScreen/splash_screen.dart';
import 'package:recipe_hub/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Hub',
      theme: ThemeData(
        primarySwatch: primaryGreen,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}