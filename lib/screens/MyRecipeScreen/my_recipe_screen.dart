import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hub/models/food_model.dart';
import 'package:recipe_hub/providers/api_service.dart';
import 'package:recipe_hub/utils/colors.dart';

class MyRecipeScreen extends StatelessWidget {
  const MyRecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataApi dataApi = Provider.of<DataApi>(context);
        Map<String, dynamic> argsRecipes =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    List<FoodModel> filteredFood = dataApi.dataFoods.where((food) {
      return food.creator.contains(argsRecipes['name']);
    }).toList();
    print(argsRecipes);
    print(filteredFood);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "My Recipes",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
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
                        bottom: 5, left: 20, right: 20, top: 5),
                    color: secondaryColor,
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  food.image,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
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
                                  Text(
                                    food.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: blackColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    food.creator,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: darkgreyColor,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
                      ],
                    ),
                  ),
                );
              },

            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
