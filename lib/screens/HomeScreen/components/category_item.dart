import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/utils/colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key,
      required this.title,
      required this.idCategory,
      required this.images})
      : super(key: key);

  final String idCategory;
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
            SizedBox(
              height: size.height * 0.20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  images,
                  fit: BoxFit.cover,
                  width: size.width,
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
