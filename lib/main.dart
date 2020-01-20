import 'package:flutter/material.dart';

import 'Pages/HomePage.dart';
import 'Pages/ListPage.dart';
import 'Pages/MenuPage.dart';
import 'Pages/TextPage.dart';
import 'destination.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        accentColor: Colors.redAccent[100],
        scaffoldBackgroundColor: Colors.white,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return _route(HomePage());
          case '/text':
            return _route(TextPage(destination: allDestinations[0],));
          case '/list':
            return _route(ListPage(destination: allDestinations[3],));
          case '/explore':
            return _route(MenuPage());
          default:
            return _route(MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: Text(settings.name),
                ),
              ),
            ));
        }
      },
      initialRoute: '/',
    );
  }

  PageRoute _route(Widget destination) {
    return MaterialPageRoute(
        builder: (BuildContext context) => destination, maintainState: true);
  }
}
