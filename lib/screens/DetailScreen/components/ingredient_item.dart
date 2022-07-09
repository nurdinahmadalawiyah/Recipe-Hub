import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/utils/colors.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          final ing = ingredients[index];
          return Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
            ),
            child: Text(ing, style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: blackColor,
            ),),
          );
        });
  }
}