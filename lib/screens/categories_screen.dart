import 'package:flutter/material.dart';
import 'package:foodapp/widgets/categories_item.dart';
import '../dummy_data .dart';

class CategorysScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(5),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              catData.id,
              catData.title,
              catData.color,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //Sliver:scrollabal GridDeleget:it create create
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
