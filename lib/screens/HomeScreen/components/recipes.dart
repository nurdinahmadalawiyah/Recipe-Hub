import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/components/button_large.dart';
import 'package:recipe_hub/components/button_medium.dart';
import 'package:recipe_hub/models/dummy_data.dart';
import 'package:recipe_hub/models/food.dart';
import 'package:recipe_hub/utils/colors.dart';

class Recipes extends StatelessWidget {
  const Recipes({
    Key? key,
    // required this.idCategory, required this.title
  }) : super(key: key);

  // final String idCategory;
  // final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, dynamic> argsRecipes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List<Food> filteredFood = dummy_food.where((food) {
      return food.category.contains(argsRecipes['id']);
    }).toList();
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          scrolledUnderElevation: 0,
          title: Text(
            'List Recipe ${argsRecipes['title']}',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: blackColor,
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton(
              color: secondaryColor,
              icon: const Icon(Icons.more_vert),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  onTap: () => Future(() {}),
                  child: ListTile(
                    trailing: const Icon(
                      Icons.info_rounded,
                      color: blackColor,
                    ),
                    title: Text(
                      'About App',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
                PopupMenuItem(
                  onTap: () => Future(
                      () => Navigator.pushReplacementNamed(context, 'welcome')),
                  child: ListTile(
                    trailing: const Icon(
                      Icons.logout_rounded,
                      color: blackColor,
                    ),
                    title: Text(
                      'Logout',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: filteredFood.length,
            itemBuilder: (context, index) {
              final food = filteredFood[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                color: secondaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(food.imageUrl),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.title,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              color: darkgreyColor,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.timer_outlined,
                                color: Colors.blueGrey,
                              ),
                              Text(
                                ' ${food.duration.toString()} Minutes',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ButtonMedium(
                            size: size,
                            text: 'See Recipe',
                            backgroundColor: primaryColor,
                            textColor: whiteColor,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
