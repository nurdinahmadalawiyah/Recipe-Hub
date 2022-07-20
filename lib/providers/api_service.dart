import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_hub/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataApi with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  TextEditingController titleController = TextEditingController();
  TextEditingController creatorController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController instructionsController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  String baseUrl = 'https://recipe-hub-backend.herokuapp.com';
  String? imageUrl;
  String? imageName;
  late Future<ProfileModel> dataProfile;

  String? imagePath;

  Future<ProfileModel> getProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString("id");
    String url = '$baseUrl/api/profile/$id';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // print(response.body);
      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {
      // print(response.body);
      throw Exception('Failed to load profile');
    }
  }

  void addRecipe() async {
    CollectionReference recipes = db.collection('recipes');
    if (titleController.text.isNotEmpty &&
        creatorController.text.isNotEmpty &&
        ingredientsController.text.isNotEmpty &&
        instructionsController.text.isNotEmpty &&
        durationController.text.isNotEmpty &&
        imageUrl!.isNotEmpty) {
      recipes.add({
        'title': titleController.text,
        'creator': creatorController.text,
        'ingredients': ingredientsController.text,
        'instructions': instructionsController.text,
        'duration': durationController.text,
        'image': imageUrl,
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
      'image': imageUrlController.text,
    });
  }

  void UploadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      imagePath = file.path;
      try {
        await FirebaseStorage.instance
            .ref(result.files.single.name)
            .putFile(file);
        imageUrl = await storage.FirebaseStorage.instance
            .ref(result.files.single.name)
            .getDownloadURL();
        imageName = result.files.single.name;
      } on storage.FirebaseException catch (e) {
        print(e);
      }
    } else {
      print("Cancelled");
    }
  }

  void deleteRecipe(String id) async {
    DocumentReference docRef = db.collection('recipes').doc(id);
    docRef.delete();
  }

  Stream<QuerySnapshot<Object?>> streamCategory() {
    CollectionReference category = db.collection('category');
    return category.snapshots();
  }

  Stream<QuerySnapshot<Object?>> streamFood() {
    CollectionReference food = db.collection('food');
    return food.snapshots();
  }

  Stream<QuerySnapshot<Object?>> streamCategoryFood(String idCategory) {
    CollectionReference food = db.collection('food');
    var filteredFood = food.where('category', isEqualTo: idCategory);
    return filteredFood.snapshots();
  }

  Stream<QuerySnapshot<Object?>> streamPopularFood() {
    CollectionReference food = db.collection('food');
    var popularFood = food.where('popular', isEqualTo: 'true');
    return popularFood.snapshots();
  }
}
