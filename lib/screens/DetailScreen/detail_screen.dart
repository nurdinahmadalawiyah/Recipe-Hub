import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/utils/colors.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsFood =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // List<String> ingredients = argsFood['ingredients'];
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 40,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    child: Image.network(
                      argsFood['image'],
                      height: MediaQuery.of(context).size.width * 0.7,
                      width: double.infinity,
                      fit: BoxFit.cover,
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
                SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 40,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              argsFood['title'],
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            Text(
              argsFood['creator'],
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: darkgreyColor,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 5,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('Ingredients',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                      )),
                  // Text('${ingredients.length.toString()} items',
                  //     style: GoogleFonts.poppins(
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.normal,
                  //       color: blackColor,
                  //     )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: whiteColor,
                border: Border.all(
                  color: primaryColor,
                  width: 1,
                ),
              ),
              child: Text(argsFood['ingredients'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: blackColor,
                  )),
              // child: IngredientItem(ingredients: ingredients),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 5,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Instructions ',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        color: primaryColor,
                      ),
                      Text(
                        ' ${argsFood['duration']} Minutes',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: whiteColor,
                border: Border.all(
                  color: primaryColor,
                  width: 1,
                ),
              ),
              child: RichText(
                softWrap: true,
                textScaleFactor: 1,
                text: TextSpan(
                  text: argsFood['instructions'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
