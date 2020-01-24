import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../destination.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key key, this.destination}) : super(key: key);

// Navigator.pushNamed(context, "/list");
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    var accountInfo = Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CachedNetworkImage(
              width: 60,
              height: 60,
              imageUrl: 'https://img.icons8.com/bubbles/2x/google-logo.png',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error, size: 60),
            ),
            title: Text(
              "Arunseto",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "arunstop@gmail.com",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: destination.color,
        title: Text(destination.title),
        centerTitle: true,
      ),
      backgroundColor: destination.color[50],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            accountInfo,
            Divider(
              height: 12,
              color: Colors.transparent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton.extended(
                  heroTag: "btn1",
                  onPressed: () {
                    Navigator.pushNamed(context, '/text');
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Catat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: destination.color,
                ),
                FloatingActionButton.extended(
                    heroTag: "btn2",
                    onPressed: () {
                      Navigator.pushNamed(context, '/list');
                    },
                    icon: Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Lihat Catatan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: destination.color),
              ],
            )
          ],
        ),
      ),
    );
  }
}
