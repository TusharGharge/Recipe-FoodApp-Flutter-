import 'package:flutter/material.dart';
import 'package:foodapp/models/meal.dart';
import '../screens/category_meal_details.dart';

class Mealitem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  Mealitem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "affordable";
        break;
      case Affordability.Pricey:
        return "pricey";
        break;
      case Affordability.Luxurious:
        return "expensive";
        break;
      default:
        return "unknown";
    }
  }

  @override
  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealScreeenDetails.routname,
      arguments: id,
    )
        .then(
      (result) {
        if (result != null) {}
      },
    );
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  // it work under stack to position the cordinates on page and stack
                  bottom: 20,
                  right: 10,
                  left: 10,
                  child: Container(
                    width: 350,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
