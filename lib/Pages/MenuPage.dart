import 'package:flutter/material.dart';
import 'package:test1_botomnav/UI/GlobalUI.dart';
import 'package:test1_botomnav/UI/StandardUI.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ///This will handle itself to get rid of the overflow error
            Wrap(
              alignment: WrapAlignment.spaceAround,
              spacing: 60,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.only(bottom: 12),
                      elevation: 6,
                      shape: roundedBorder(24),
                      child: InkWell(
                        customBorder: roundedBorder(24),
                        splashColor: Colors.grey,
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.healing,
                              size: 120,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/text');
                          myToast(msg: 'Navigated.', danger: false);
                        },
                      ),
                    ),
                    Text(
                          'Diagnose',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.only(bottom: 12),
                      elevation: 6,
                      shape: roundedBorder(24),
                      child: InkWell(
                        customBorder: roundedBorder(24),
                        splashColor: Colors.grey,
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              size: 120,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        onTap: () {
                          myToast(msg: 'Catatan telah terhapus.', danger: false);
                        },
                      ),
                    ),
                    Text(
                          'Diagnose',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Wrap(
                spacing: 12, // gap between adjacent chips
                runSpacing: 0, // gap between lines
                children: <Widget>[
                  chipDesign("Food", Color(0xFF4fc3f7)),
                  chipDesign("Lifestyle", Color(0xFFffb74d)),
                  chipDesign("Health", Color(0xFFff8a65)),
                  chipDesign("Sports", Color(0xFF9575cd)),
                  chipDesign("Nature", Color(0xFF4db6ac)),
                  chipDesign("Fashion", Color(0xFFf06292)),
                  chipDesign("Heritage", Color(0xFFa1887f)),
                  chipDesign("City Life", Color(0xFF90a4ae)),
                  chipDesign("Entertainment", Color(0xFFba68c8)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chipDesign(String label, Color color) => Container(
        child: Chip(
          label: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: color,
          elevation: 6,
          shadowColor: Colors.grey[50],
          padding: EdgeInsets.all(4),
        ),
      );
}
