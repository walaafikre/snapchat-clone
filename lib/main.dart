import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_snapchat_clone_full/screens/dashboard.dart';
import 'package:flutter_snapchat_clone_full/screens/splash_screen.dart';
import 'package:flutter_snapchat_clone_full/utils/strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        home: Splash(),
        routes: <String, WidgetBuilder>{
          Dashboard.tag: (BuildContext context) => Dashboard(),
        });
  }
}
