import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class Auth with ChangeNotifier {
//   String authUrl = 'https://a5d0-125-164-20-74.ngrok.io';
//   // var auth = FirebaseAuth.instance;

//   // Stream<User?> changeState() {
//   //   return auth.authStateChanges();
//   // }

//   // void login(String email, String password) async {
//   //   try {
//   //     await auth.signInWithEmailAndPassword(email: email, password: password);
//   //   } on FirebaseAuthException catch (e) {
//   //     print(e);
//   //   }
//   // }

//   // void resgister(String email, String password) async {
//   //   try {
//   //     await auth.createUserWithEmailAndPassword(
//   //         email: email, password: password);
//   //   } on FirebaseAuthException catch (e) {
//   //     print(e);
//   //   }
//   // }

//   // Future<bool> register(String name, String email, String password) async {
//   //   String url = '$authUrl/api/register';

//   //   var response = await http.post(Uri.parse(url), body: {
//   //     'name': name,
//   //     'email': email,
//   //     'password': password,
//   //   });

//   //   final dataLogin = jsonDecode(response.body);
//   //   if (response.statusCode == 200) {
//   //     final data = jsonDecode(dataLogin);
//   //     String resStatus = data["message"];
//   //     // notifyListeners();
//   //     return true;
//   //   } else {
//   //     return false;
//   //   }
//   // }

//   // void logout() async {
//   //   await auth.signOut();
//   // }

//   Future<bool> login(String name, String email, String password) async {
//       var auth;
//     String url = '$authUrl/api/category';
//     var response = await http.post(Uri.parse(url),
//         headers: {'Content-Type': 'application/json; charset=UTF-8'},
//         body: jsonEncode({
//           'email': email,
//           'password': password,
//         }));
//     if (response.statusCode == 200) {
//       String dataLogin = jsonDecode(response.body);
//       // String resStatus = dataLogin["message"];
//       notifyListeners();
//       auth.add(email, password);
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
