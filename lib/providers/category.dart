import 'dart:convert';

import 'package:flutter/Material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_hub/models/category_model.dart';

class DataCategory with ChangeNotifier {
  List<CategoryModel> dataCategories = [];
  String categoryUrl = 'https://dbc2-36-79-187-57.ngrok.io';

  Future<void> getCategory() async {
    String url = '$categoryUrl/api/category';
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
}
