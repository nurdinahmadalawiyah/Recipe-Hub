import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/providers/category.dart';
import 'package:recipe_hub/utils/colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key,
      // required this.dataCategories
      required this.title, required this.idCategory, required this.images
      })
      : super(key: key);

  final String idCategory;
  final String title;
  final String images;

  // DataCategory dataCategories;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        'recipes',
        arguments: {
          'idCategory': idCategory,
          'title': title,
        },
      ),
      child: Card(
        elevation: 0,
        color: secondaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.height * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(images),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Center(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: darkgreyColor,
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
