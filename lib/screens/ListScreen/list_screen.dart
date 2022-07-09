import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/models/dummy_data.dart';
import 'package:recipe_hub/utils/colors.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsRecipes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'List Recipes',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dummy_food.length,
              itemBuilder: (context, index) {
                final food = dummy_food[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail', arguments: {
                      'title': food.title,
                      'image': food.imageUrl,
                      'ingredients': food.ingredients,
                    });
                  },
                  child: Card(
                    margin: const EdgeInsets.only(
                        bottom: 5, left: 20, right: 20, top: 5),
                    color: secondaryColor,
                    elevation: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.1,
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
                              Row(
                                children: [
                                  const Icon(
                                    Icons.timer_outlined,
                                    color: darkgreyColor,
                                    size: 20,
                                  ),
                                  Text(
                                    ' ${food.duration.toString()} Minutes',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: darkgreyColor,
                                    ),
                                  ),
                                ],
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
          ),
        ],
      ),
    );
  }
}
