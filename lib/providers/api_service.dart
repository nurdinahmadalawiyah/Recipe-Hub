import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_hub/models/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_hub/models/food_model.dart';
import 'package:recipe_hub/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataApi with ChangeNotifier {
  String baseUrl = 'https://386c-36-79-187-57.ngrok.io';

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

  static of(BuildContext context) {}
  
}
