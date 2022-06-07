import 'package:flutter/material.dart';
import '../data/list_category.dart';
import '../widget/category_item.dart';
import '../models/category.dart';
import '../widget/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myPrivateBody = SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Column(
            children: [
              _makeSearchBox(),
              const SizedBox(height: 5.0),
              _makeTitle("Category", context),
              _makeSlider(myCategory),
            ],
          ),
        ),
      ),
    );

    final body = GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: myCategory
            .map((catData) => CategoryItem(
                  catData.id as String,
                  catData.title as String,
                  catData.color,
                ))
            .toList());
    return body;
  }
}

Widget _makeSearchBox() {
  return Row(
    children: <Widget>[
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.grey[300],
          ),
          child: const TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.grey,
                )),
          ),
        ),
      ),
      const SizedBox(width: 20),
      const Icon(Icons.filter_alt, color: Colors.black45, size: 25)
    ],
  );
}

Widget _makeTitle(String text, ctx) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: Theme.of(ctx).textTheme.bodyText1,
      ),
      TextButton(
          onPressed: () {},
          child: Text(
            'See All',
            style: Theme.of(ctx).textTheme.bodyText2,
          ))
    ],
  );
}

Widget _makeSlider(List<Category> categories) {
  List<Widget> contents = [];

  for (Category category in categories) {
    contents.add(_makeCategory(category));
  }

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: contents,
    ),
  );
}

Widget _makeCategory(Category category) {
  return Card(
    elevation: 5,
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        debugPrint('${category.title} tap');
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Text(category.title as String),
      ),
    ),
  );
}
