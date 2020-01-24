import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test1_botomnav/UI/GlobalUI.dart';

import '../destination.dart';
import '../note.dart';

class TextPage extends StatefulWidget {
  const TextPage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  TextEditingController _textController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Catatan'),
        backgroundColor: widget.destination.color,
      ),
      backgroundColor: widget.destination.color[50],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          alignment: Alignment.topLeft,
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _textController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Bagaimana perasaan anda?'),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  color: Colors.red,
                  textColor: Colors.white,
                  label: Text('Catat'),
                  icon: Icon(Icons.check),
                  onPressed: () {
                    if (_textController.text == null ||
                        _textController.text == '') {
                      dToast(msg: 'Catatan masih kosong.', danger: true);
                      return;
                    }
                    //add notes
                    listNotes.add(Note('1', _textController.text, '2'));
                    //display snackbar
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      backgroundColor: Colors.grey,
                      content: Text(listNotes.length.toString()),
                    ));
                    dToast(msg: 'Sukses menambah catatan.', danger: false);
                    Navigator.pop(context);
                    //wait 2s to go back to the main page
                    // Timer(
                    //   Duration(seconds: 2),
                    //   () => Navigator.pop(context),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
