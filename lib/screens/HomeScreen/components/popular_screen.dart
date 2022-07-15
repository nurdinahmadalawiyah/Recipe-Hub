import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hub/models/food_model.dart';
import 'package:recipe_hub/providers/api_service.dart';
import 'package:recipe_hub/screens/HomeScreen/components/popular_item.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataApi dataApi = Provider.of<DataApi>(context);
    List<FoodModel> filteredFood = dataApi.dataFoods.where((food) {
      return food.popular.contains('true');
    }).toList();
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8),
      itemCount: filteredFood.length,
      itemBuilder: (context, index) {
        final popular = filteredFood[index];
        return PopularItem(
          title: popular.title,
          ingredients: popular.ingredients,
          creator: popular.creator,
          image: popular.image,
          duration: popular.duration,
          instructions: popular.instructions,
        );
      },
    );
  }
}
