import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hub/models/food_model.dart';
import 'package:recipe_hub/providers/food.dart';
import 'package:recipe_hub/utils/colors.dart';

class Recipes extends StatelessWidget {
  const Recipes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataFood dataFoods = Provider.of<DataFood>(context);
    Map<String, dynamic> argsRecipes =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    List<FoodModel> filteredFood = dataFoods.dataFoods.where((food) {
      return food.category.contains(argsRecipes['id']);
    }).toList();
    print(filteredFood);
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
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'detail', arguments: {
                'title': food.title,
                'image': food.image,
                'creator': food.creator,
                'duration': food.duration,
                'ingredients': food.ingredients,
                'instructions': food.instructions,
              });
            },
            child: Card(
              margin: const EdgeInsets.only(
                  bottom: 10, left: 20, right: 20, top: 10),
              color: secondaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        food.image,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                food.title,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: darkgreyColor,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer_outlined,
                                  color: primaryColor,
                                ),
                                Text(
                                  ' ${food.duration.toString()} Minutes',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          food.creator.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: darkgreyColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
