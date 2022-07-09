import 'package:flutter/material.dart';
import 'package:recipe_hub/screens/DetailScreen/detail_screen.dart';
import 'package:recipe_hub/screens/HomeScreen/components/recipes.dart';
import 'package:recipe_hub/screens/HomeScreen/home_screen.dart';
import 'package:recipe_hub/screens/LoginScreen/login_screen.dart';
import 'package:recipe_hub/screens/RegisterScreen/register_screen.dart';
import 'package:recipe_hub/screens/SplashScreen/splash_screen.dart';
import 'package:recipe_hub/screens/WelcomeScreen/welcome_screen.dart';

Map<String, WidgetBuilder> get routes {
    return {
      '/' :(context) => const SplashScreen(),
      'welcome' : (context) => const WelcomeScreen(),
      'login' : (context) => const LoginScreen(),
      'register' : (context) => const RegisterScreen(),
      'home' : (context) => const HomeScreen(),
      'recipes' :(context) => const Recipes(),
      'detail' : (context) => const DetailScreen(),
    };
  }