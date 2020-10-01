import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data .dart';
import '../models/meal.dart';

class Categoryscreenmeal extends StatefulWidget {
  static const routname = '/category-meal';
  final List<Meal> avilableMeals;
  Categoryscreenmeal(this.avilableMeals);

  @override
  _CategoryscreenmealState createState() => _CategoryscreenmealState();
}

class _CategoryscreenmealState extends State<Categoryscreenmeal> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadInitData = false;

  void initState() {
    super.initState();
  }

  void didChangeDepandencies() {}
  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryid = routeArgs['id'];
      displayedMeals = widget.avilableMeals.where((meal) {
        return meal.categories.contains(categoryid);
      }).toList();
    }

    _loadInitData = true;
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Mealitem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            duration: displayedMeals[index].duration,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
