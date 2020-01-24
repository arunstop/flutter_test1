import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1_botomnav/UI/GlobalUI.dart';
import 'package:test1_botomnav/UI/StandardUI.dart';
import 'package:test1_botomnav/note.dart';
import '../destination.dart';

class ListPage extends StatefulWidget {
  final Destination destination;

  const ListPage({Key key, this.destination}) : super(key: key);
  @override
  _ListPageState createState() => _ListPageState(destination);
}

class _ListPageState extends State<ListPage> {
  final Destination destination;

  _ListPageState(this.destination);

  @override
  Widget build(BuildContext context) {
    const List<int> shades = <int>[
      50,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900
    ];
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(destination.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: () {
              dIosOptDialog(
                context: context,
                title: 'Delete All',
                content:
                    Text('Aksi ini akan menghapus semua catatan anda, apakah anda ingin melakukannya?'),
                danger: true,
                action: () {
                  listNotes.clear();
                  Navigator.pop(context);
                  setState(() {
                    dToast(
                      msg: 'Semua catatan terhapus.',
                      danger: false,
                    );
                  });
                },
              );
            },
          )
        ],
        backgroundColor: destination.color,
      ),
      backgroundColor: destination.color[50],
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(12),
            child: Column(
              children: listNotes.map((Note note) {
                return Card(
                    shape: roundedBorder(60),
                    // color: destination.color[shades[listNotes.indexOf(note)]],
                    color: destination.color[100],
                    child: InkWell(
                        customBorder: roundedBorder(60),
                        splashColor: destination.color[300],
                        onLongPress: () {
                          dAndroidOptDialog(
                            context: context,
                            title: 'Hapus Catatan ?',
                            content: Text('Apakah anda ingin menghapus catatan?'),
                            danger: true,
                            action: () {
                              listNotes.remove(note);
                              dToast(
                                  msg: 'Catatan telah terhapus.',
                                  danger: false);
                              Navigator.pop(context);
                              setState(() {});
                            },
                          );
                        },
                        onTap: () {
                          bottomSheetDialog(
                            context: context,
                            title: note.title,
                            content: Text(note.content),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.asset('assets/images/logo.png'),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(6, 0, 12, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      note.title,
                                      overflow: TextOverflow.fade,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Divider(
                                      height: 6,
                                    ),
                                    Text(
                                      note.content,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )));
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
