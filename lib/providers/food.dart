import 'dart:convert';

import 'package:flutter/Material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_hub/models/food_model.dart';

class DataFood with ChangeNotifier {
  List<FoodModel> dataFoods = [];
  String foodUrl = 'https://a2ce-125-164-17-245.ngrok.io';

  Future<void> getFood() async {
    String url = '$foodUrl/api/food';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List extractData = (jsonDecode(response.body))['data'];
      dataFoods.clear();
      for (var data in extractData) {
        dataFoods.add(
          FoodModel(
            id: data['id'],
            title: data['title'],
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
}
