// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

String foodModelToJson(List<FoodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodModel {
    FoodModel({
        required this.id,
        required this.title,
        required this.category,
        required this.ingredients,
        required this.instructions,
        required this.duration,
        required this.image,
    });

    int id;
    String title;
    String category;
    String ingredients;
    String instructions;
    int duration;
    String image;

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        ingredients: json["ingredients"],
        instructions: json["instructions"],
        duration: json["duration"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "ingredients": ingredients,
        "instructions": instructions,
        "duration": duration,
        "image": image,
    };
}
