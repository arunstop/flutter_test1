import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test1_botomnav/Pages/CustomWidgets/NewsWidget.dart';
import 'package:test1_botomnav/UI/GlobalUI.dart';
import 'package:test1_botomnav/news.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int limit = 5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listNews.clear();

    for (int i = 0; i < limit; i++) {
      listNews.add(NewsWidget(
        title:
            'This is the title of the news, to show the headline/short information of the news',
        content:
            'Content of news is a detailed description/information of the news itself',
        action: () {
          Navigator.pushNamed(context, '/list');
        },
        longAction: () {
          iosDialog(
            context: context,
            title: 'Delete',
            content:
                'Aksi ini akan menghapus berita yang anda pilih, lakukan?',
            danger: true,
            action: () {
              listNews.remove(listNews[i]);
              Navigator.pop(context);
              setState(() {
                limit = listNews.length;
                myToast(
                  msg: 'Berita terhapus.',
                  danger: false,
                );
              });
            },
          );
        },
      ));
    }

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  children: listNews.map((NewsWidget news) {
                    return news;
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
