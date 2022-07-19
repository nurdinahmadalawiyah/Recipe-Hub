import 'package:flutter/material.dart';
import 'package:recipe_hub/screens/AboutScreen/about_screen.dart';
import 'package:recipe_hub/screens/ComunityRecipeScreen/add_recipe_screen.dart';
import 'package:recipe_hub/screens/ComunityRecipeScreen/comunity_recipe_screen.dart';
import 'package:recipe_hub/screens/ComunityRecipeScreen/detail_comunity.dart';
import 'package:recipe_hub/screens/DetailScreen/detail_screen.dart';
import 'package:recipe_hub/screens/HomeScreen/components/recipes.dart';
import 'package:recipe_hub/screens/main_screen.dart';
import 'package:recipe_hub/screens/LoginScreen/login_screen.dart';
import 'package:recipe_hub/screens/RegisterScreen/register_screen.dart';
import 'package:recipe_hub/screens/SplashScreen/splash_screen.dart';
import 'package:recipe_hub/screens/WelcomeScreen/welcome_screen.dart';
import 'package:recipe_hub/screens/check_auth.dart';

Map<String, WidgetBuilder> get routes {
    return {
      '/' :(context) => const SplashScreen(),
      'check_auth' :(context) => const CheckAuth(),
      'welcome' : (context) => const WelcomeScreen(),
      'login' : (context) => const LoginScreen(),
      'register' : (context) => const RegisterScreen(),
      'main' : (context) => const MainScreen(),
      'recipes' :(context) => const Recipes(),
      'detail' : (context) => const DetailScreen(),
      'detail-comunity' :(context) => const DetailComunityScreen(),
      'about' : (context) => const AboutScreen(),
      'add_recipe' : (context) => const AddRecipeScreen(),
      'comunity_recipe' : (context) => const ComunityRecipeScreen(),
    };
  }