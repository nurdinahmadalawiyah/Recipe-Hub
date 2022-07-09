import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/utils/colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.title, required this.id, required this.images})
      : super(key: key);

  final String id;
  final String title;
  final String images;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        'recipes',
        arguments: {
          'id': id,
          'title': title,
        },
      ),
      child: Card(
        elevation: 0,
        color: secondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.height * 0.25,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(images),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: darkgreyColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
