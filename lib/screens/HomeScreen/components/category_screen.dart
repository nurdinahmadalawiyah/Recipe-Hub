import 'package:flutter/material.dart';
import 'package:recipe_hub/models/dummy_data.dart';
import 'package:recipe_hub/screens/HomeScreen/components/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 2/3
      ),
      itemCount: dummyCategories.length,
      itemBuilder: (context, index) {
        final category = dummyCategories[index];
        return CategoryItem(id: category.id, images: category.images, title: category.title, );
      },
    );
  }
}
