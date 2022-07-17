import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hub/providers/api_service.dart';
import 'package:recipe_hub/screens/HomeScreen/components/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataApi dataCategory = Provider.of<DataApi>(context);
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 4),
      itemCount: dataCategory.dataCategories.length,
      itemBuilder: (context, index) {
        final category = dataCategory.dataCategories[index];
        return CategoryItem(
          id: category.id.toString(),
          idCategory: category.idCategory,
          images: category.image,
          title: category.title,
        );
      },
    );
  }
}
