import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:heal/activity.dart';
import 'package:heal/css/color.dart';
import 'package:heal/food.dart';
import 'package:heal/home2.dart';
import 'package:heal/water.dart';

/// This is the main application widget.
class Home extends StatefulWidget {
  @override
  _home createState() => _home();
}

class _home extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    home2(),
    food(),
    water(),
    activity(),
    Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('การตั้งค่า'),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Foundation.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.silverware_variant),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.cup),
            label: 'Drink',
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.run),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Entypo.user),
            label: 'User',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: blue2,
        selectedIconTheme: IconThemeData(size: 40),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
