import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_Screen.dart';
import '../widgets/Main_drawer.dart';
import '../screens/favorite_Screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  void initState() {
    _pages = [
      {
        'page': CategorysScreen(),
        'title': 'Category',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'your favourite',
      },
    ];
    super.initState();
  }

  void _selectedpage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(), // drawer or navitem(website )
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedpage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorite'),
          ),
        ],
      ),
    );
  }
}
