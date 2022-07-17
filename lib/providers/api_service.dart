import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_hub/models/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_hub/models/food_model.dart';
import 'package:recipe_hub/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataApi with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  TextEditingController titleController = TextEditingController();
  TextEditingController creatorController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController instructionsController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  String baseUrl = 'https://recipe-hub-backend.herokuapp.com';

  List<CategoryModel> dataCategories = [];
  Future<void> getCategory() async {
    String url = '$baseUrl/api/category';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List extractData = (jsonDecode(response.body))['data'];
      dataCategories.clear();
      for (var data in extractData) {
        dataCategories.add(
          CategoryModel(
            id: data['id'],
            idCategory: data['idCategory'],
            title: data['title'],
            image: data['image'],
          ),
        );
      }
    }
  }

  List<FoodModel> dataFoods = [];
  Future<void> getFood() async {
    String url = '$baseUrl/api/food';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List extractData = (jsonDecode(response.body))['data'];
      // print(response.body);
      dataFoods.clear();
      for (var data in extractData) {
        dataFoods.add(
          FoodModel(
            id: data['id'],
            title: data['title'],
            creator: data['creator'],
            category: data['category'],
            ingredients: data['ingredients'],
            instructions: data['instructions'],
            duration: data['duration'],
            image: data['image'],
            popular: data['popular'],
          ),
        );
      }
    }
  }

  late Future<ProfileModel> dataProfile;
  Future<ProfileModel> getProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString("id");
    String url = '$baseUrl/api/profile/$id';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to load post');
    }
  }

  void addRecipe() {
    CollectionReference recipes = db.collection('recipes');
    if (titleController.text.isNotEmpty &&
        creatorController.text.isNotEmpty &&
        ingredientsController.text.isNotEmpty &&
        instructionsController.text.isNotEmpty &&
        durationController.text.isNotEmpty) {
      recipes.add({
        'title': titleController.text,
        'creator': creatorController.text,
        'ingredients': ingredientsController.text,
        'instructions': instructionsController.text,
        'duration': durationController.text,
      });
      titleController.clear();
      creatorController.clear();
      ingredientsController.clear();
      instructionsController.clear();
      durationController.clear();
    } else {
      print('data tidak boleh kosong');
    }
  }

  Future<QuerySnapshot<Object?>> getRecipe() async {
    CollectionReference recipes = db.collection('recipes');
    return await recipes.get();
  }

  Stream<QuerySnapshot<Object?>> streamRecipe() {
    CollectionReference recipes = db.collection('recipes');
    return recipes.snapshots();
  }

  Future<DocumentSnapshot<Object?>> getRecipeByIdDoc(String id) {
    DocumentReference docRef = db.collection('recipes').doc(id);

    return docRef.get();
  }

  void updateRecipe(String id) {
    DocumentReference docRef = db.collection('recipes').doc(id);

    docRef.update({
      'title': titleController.text,
      'creator': creatorController.text,
      'ingredients': ingredientsController.text,
      'instructions': instructionsController.text,
      'duration': durationController.text,
    });
  }

  void deleteRecipe(String id) {
    DocumentReference docRef = db.collection('recipes').doc(id);
    docRef.delete();
  }

//   Future deleteFood(int id) async {
//     List<FoodModel> data = [];
//     try {
//       http.Response hasil = await http.post(
//           Uri.parse('$baseUrl/api/food/$id'),
//           headers: {"Accept": "application/json"},
//           body: json.encode(data));
//       if (hasil.statusCode == 200) {
//         return true;
//       } else {
// // print("error status " + hasil.statusCode.toString());
//         return false;
//       }
//     } catch (e) {
// // print("error catch $e");
//       return false;
//     }
//   }

  // Future<FoodModel> deleteFood(String id) async {
  //   final http.Response response = await http.delete(
  //     Uri.parse('$baseUrl/api/food/$id'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     return dataFoods;
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  // }
}
