import 'dart:convert';

import 'package:http/http.dart' as http;

class UserViewModel {
  Future register(String name, String email, String password) async {
    Map data = {"name": name, "email": email, "password": password};

    try {
      http.Response hasil = await http.post(
        Uri.parse('http://backend-recipe-hub.test/api/register'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: json.encode(data)
      );
      if (hasil.statusCode == 200) {
        Map<String, dynamic> hasilJson = json.decode(hasil.body);
        if (hasilJson['status'] == 'success') {
          Map<String, dynamic> data = hasilJson['data'];
        } else {
          return hasilJson;
        }
        
      } else {
        print("error status " + hasil.statusCode.toString());
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}