import 'package:flutter/material.dart';
import '/models/meal.dart';
import '/widget/meal_item.dart';
import '../data/list_meal.dart';
// import '../widget/app_bar.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeal;

  const CategoryMealsScreen(this.availableMeal, {Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeal;
  var _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeal = widget.availableMeal.where((element) {
        return element.categories!.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal?.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal?[index].id,
            title: displayedMeal?[index].title,
            imageUrl: displayedMeal?[index].imageUrl,
            duration: displayedMeal?[index].duration,
            affordability: displayedMeal?[index].affordability,
            complexity: displayedMeal?[index].complexity,
            // removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeal?.length,
      ),
    );
  }
}
