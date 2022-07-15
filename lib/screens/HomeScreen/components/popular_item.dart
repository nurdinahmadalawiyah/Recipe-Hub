import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/utils/colors.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    Key? key,
    required this.title,
    required this.image,
    required this.creator,
    required this.duration,
    required this.ingredients,
    required this.instructions,
  }) : super(key: key);

  final String title;
  final String image;
  final String creator;
  final int duration;
  final String ingredients;
  final String instructions;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'detail', arguments: {
        'title': title,
        'image': image,
        'creator': creator,
        'duration': duration,
        'ingredients': ingredients,
        'instructions': instructions,
      }),
      child: Card(
        elevation: 0,
        color: secondaryColor,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      blackColor.withOpacity(0.7),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )),
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
                ),
              ),
            )
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(12),
            //   child: Image.network(
            //     image,
            //     fit: BoxFit.cover,
            //     width: size.width,
            //     loadingBuilder: (context, child, loadingProgress) {
            //       if (loadingProgress == null) {
            //         return child;
            //       }
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     },
            //   ),
            // ),
            ),
      ),
    );
  }
}
