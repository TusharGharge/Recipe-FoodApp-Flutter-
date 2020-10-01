import 'package:flutter/material.dart';
import 'package:foodapp/screens/setting_scrren.dart';

class MainDrawer extends StatelessWidget {
  Widget builderList(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Robotocondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'cooking up',
              style: TextStyle(
                // fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          builderList("Meal", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          builderList('Settings', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(SettingScreen.routname);
          }),
        ],
      ),
    );
  }
}
