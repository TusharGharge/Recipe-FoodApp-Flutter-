import 'package:flutter/material.dart';
import '../widgets/Main_drawer.dart';

class SettingScreen extends StatefulWidget {
  static const routname = "/settings";
  final Function saveFilter;
  final Map<String, bool> currentFilters;
  SettingScreen(this.currentFilters, this.saveFilter);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _loctoseFree = false;

  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _loctoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTitle(
    String title,
    String description,
    var currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Setting"), actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _vegetarian,
                'vegan': _vegan,
                'vegetarian': _loctoseFree,
              };
              widget.saveFilter(selectedFilters);
            },
          ),
        ]),
        drawer: MainDrawer(),
        body: Column(children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust the control.',
                style: Theme.of(context).textTheme.title,
              )),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTitle(
                  'Gluten-free',
                  'Only gluten-free food.',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'vegetarian',
                  'Only egetarian food.',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'vegan',
                  'Only vegan food.',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'loctoseFree',
                  'Only loctoseFree-free food.',
                  _loctoseFree,
                  (newValue) {
                    setState(
                      () {
                        _loctoseFree = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ]));
  }
}
