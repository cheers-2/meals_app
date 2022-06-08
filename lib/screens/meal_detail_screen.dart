import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/list_meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final detailMeal = myMeals.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text('${detailMeal.title} Recipe')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 270,
              width: double.infinity,
              child: Image.network(
                detailMeal.imageUrl as String,
                fit: BoxFit.cover,
              ),
            ),
            //* Ingredients
            _makeTitle('Ingredients :', context),
            _makeContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      detailMeal.ingredients![index],
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                itemCount: detailMeal.ingredients!.length,
              ),
            ),

            //* Step
            _makeTitle('Steps : ', context),
            _makeContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        detailMeal.steps![index],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
                itemCount: detailMeal.steps!.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () {
          //* Pop untuk kembali ke halam sebelumnya(BEDA DENGAN BACK BUTTON DIATAS) dengan mengirimkan parameter -> MealID
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}

Widget _makeTitle(String text, BuildContext context) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Text(
      text,
      style: Theme.of(context).textTheme.headline6,
    ),
  );
}

Widget _makeContainer(Widget child) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black12,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    padding: const EdgeInsets.all(10),
    height: 150,
    width: double.infinity,
    child: child,
  );
}
