import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Wrap(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => Fluttertoast.showToast(msg: 's'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
