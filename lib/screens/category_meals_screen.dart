import 'package:flutter/material.dart';
import 'package:meals_app/widget/meal_item.dart';
import '../data/list_meal.dart';
// import '../widget/app_bar.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);
  // final String categoryId;
  // final String categoryTitle;
  // const CategoryMealsScreen(this.categoryId, this.categoryTitle, {Key? key})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final listMealsByCategory = myMeals.where((element) {
      return element.categories!.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: listMealsByCategory[index].id,
            title: listMealsByCategory[index].title,
            imageUrl: listMealsByCategory[index].imageUrl,
            duration: listMealsByCategory[index].duration,
            affordability: listMealsByCategory[index].affordability,
            complexity: listMealsByCategory[index].complexity,
          );
        },
        itemCount: listMealsByCategory.length,
      ),
    );
  }
}
