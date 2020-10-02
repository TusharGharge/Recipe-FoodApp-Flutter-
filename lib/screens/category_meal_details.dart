import 'package:flutter/material.dart';
import '../dummy_data .dart';
import '../models/meal.dart';

class MealScreeenDetails extends StatelessWidget {
  static const routname = '/details-meals';
  final Function togglerFavorite;
  final Function isFavorite;
  MealScreeenDetails(this.togglerFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, text) {
    return Container(
        child: Text(
      text,
      style: Theme.of(context).textTheme.title,
    ));
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 350,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectMeal.title}'),
      ),
      body: SingleChildScrollView(
        // for extend page widget
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, 'Ingredients'),
          SingleChildScrollView(
            child: buildContainer(
              ListView.builder(
                 itemBuilder: (ctx, index) => Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectMeal.ingredients[index],
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: selectMeal.steps.length,
            ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 2,
//                     vertical: 10,
//                   ),
//                   child: Card(
//                     color: Colors.white,
//                     child: Text(selectMeal.ingredients[index]),
//                   ),
//                 ),
//               ),
//             ),
          ),
          buildSectionTitle(context, 'Steps'),
          buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(
                      selectMeal.steps[index],
                    ),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectMeal.steps.length,
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(mealid) ? Icons.star : Icons.star_border),
        onPressed: () => togglerFavorite(mealid),
      ),
    );
  }
}
