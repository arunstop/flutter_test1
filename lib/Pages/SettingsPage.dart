import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test1_botomnav/UI/GlobalUI.dart';
import 'package:url_launcher/url_launcher.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.person_outline, size: 48),
                title: Text(
                  "Preferences",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  dIosOptDialog(context: context, action: (){});
                },
              ),
              ListTile(
                leading: Icon(Icons.help_outline, size: 48),
                title: Text(
                  "Help",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  const url = 'https://flutter.dev';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline, size: 48),
                title: Text(
                  "About",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  const url = 'https://flutter.dev';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.mail_outline, size: 48),
                title: Text(
                  "Feedback",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  const url =
                      'mailto:arunstop@gmail.com?subject=Flutter&body=Test';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app, size: 48),
                title: Text(
                  "Log out",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  return dAndroidOptDialog(
                    context: context,
                    title: 'Log Out',
                    content: Text('Keluar dari aplikasi ini? Tekan yes.'),
                    danger: true,
                    action: () {
                      dToast(msg: 'Keluar.', danger: false);
                       SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                  );
                  //exit app
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
