import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hub/models/dummy_data.dart';
import 'package:recipe_hub/providers/category.dart';
import 'package:recipe_hub/screens/HomeScreen/components/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataCategory dataCategory = Provider.of<DataCategory>(context);
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 4 / 5),
      // itemCount: dummyCategories.length,
      itemCount: dataCategory.dataCategories.length,
      itemBuilder: (context, index) {
        // final category = dummyCategories[index];
        final category = dataCategory.dataCategories[index];
        return CategoryItem(
          idCategory: category.idCategory,
          images: category.image,
          title: category.title,
        );
      },
    );
  }
}
