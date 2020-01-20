import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test1_botomnav/UI/StandardUI.dart';

var myToast = ({
  String msg,
  bool danger = false,
}) {
  Color bgColor = Colors.blue;
  if (danger) bgColor = Colors.red;

  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 16.0);
};

var iosDialog = ({
  BuildContext context,
  String title,
  String content,
  bool danger = false,
  Function action,
}) {
  Color bgColor = Colors.blue[400];
  if (danger) bgColor = Colors.red[400];
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(
              color: bgColor,
            ),
          ),
          content: Text(content),
          actions: <Widget>[
            Container(
              color: bgColor,
              child: CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(
                  "Yes",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  action();
                },
              ),
            ),
          ],
        );
      });
};

var androidDialog = ({
  BuildContext context,
  String title,
  String content,
  bool danger = false,
  Function action,
}) {
  Color mainColor = (danger ? Colors.red[400] : Colors.blue[400]);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: roundedBorder(12),
          title: Text(
            title,
            style: TextStyle(color: mainColor),
          ),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              textColor: Colors.black,
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            RaisedButton(
              shape: roundedBorder(12),
              color: mainColor,
              elevation: 0,
              child: Text('OK'),
              onPressed: () {
                action();
              },
            ),
          ],
        );
      });
};

var bottomSheetDialog = ({
  BuildContext context,
  String title,
  Widget content,
}) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    context: context,
    builder: (BuildContext bc) {
      return Container(
        child: Wrap(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: 60,
                        height: 6,
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Divider(
                      height: 24,
                      color: Colors.black,
                    ),
                    content,
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
};
