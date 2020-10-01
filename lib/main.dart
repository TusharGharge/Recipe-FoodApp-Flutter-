import 'package:flutter/material.dart';
// import 'package:foodapp/dummy_data%20.dart';
import 'screens/tab_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_screen_meal.dart';
import 'package:foodapp/screens/category_meal_details.dart';
import './screens/setting_scrren.dart';
import 'dummy_data .dart';
import 'models/meal.dart';
import './screens/favorite_Screen.dart';

void main() => runApp(MYapp());

class MYapp extends StatefulWidget {
  @override
  _MYappState createState() => _MYappState();
}

class _MYappState extends State<MYapp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _togglerFavorite(String mealId) {
    final exitingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (exitingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(exitingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DailyMeal',
        theme: ThemeData(
            primaryColor: Colors.blue,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 249, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ))),
        // home: CategorysScreen(),
        routes: {
          '/': (ctx) => TabsScreen(_favoriteMeals),
          Categoryscreenmeal.routname: (ctx) =>
              Categoryscreenmeal(_availableMeals),
          MealScreeenDetails.routname: (ctx) =>
              MealScreeenDetails(_togglerFavorite, _isMealFavorite),
          SettingScreen.routname: (ctx) => SettingScreen(_filters, _setFilters),
        });
  }
}
