import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:recipe_hub/components/button_medium.dart';
import 'package:recipe_hub/models/profile_model.dart';
import 'package:recipe_hub/providers/api_service.dart';
import 'package:recipe_hub/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<ProfileModel> futureProfile;

  Future<ProfileModel> getProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString("id");
    String url = 'https://386c-36-79-187-57.ngrok.io/api/profile/$id';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureProfile = getProfile();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DataApi dataFoods = Provider.of<DataApi>(context);
    return Center(
      child: SingleChildScrollView(
        child: FutureBuilder<ProfileModel>(
          future: futureProfile,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: backgroundColor,
                      border: Border.all(
                        color: primaryColor,
                        width: 5,
                      ),
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      size: 180,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    snapshot.data!.name,
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    snapshot.data!.email,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: darkgreyColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ButtonMedium(
                    size: size,
                    text: "My Recipe",
                    backgroundColor: primaryColor,
                    textColor: whiteColor,
                    onPressed: () {
                      Navigator.pushNamed(context, 'user_recipe');
                    },
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
