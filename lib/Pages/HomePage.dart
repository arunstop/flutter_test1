import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:test1_botomnav/Pages/MenuPage.dart';
import 'package:test1_botomnav/Pages/RootPage.dart';

import '../destination.dart';
import 'FeedPage.dart';
import 'SettingsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  int _currentIndex = 0;
  List<Widget> menus = <Widget>[
    RootPage(destination: allDestinations[2],),
    MenuPage(),
    FeedPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: menus[_currentIndex],
      ),
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Colors.blueAccent,
        tabs: allDestinations.map<TabData>((Destination destination) {
          return TabData(iconData: destination.icon, title: destination.title);
        }).toList(),
        onTabChangedListener: (int index) {
          setState(() {

            _currentIndex = index;
          });
        },
      ),
    );
  }
}
