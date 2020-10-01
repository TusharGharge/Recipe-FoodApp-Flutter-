import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('favorite-start adding some'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return Mealitem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            duration: favoriteMeals[index].duration,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
