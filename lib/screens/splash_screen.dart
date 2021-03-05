import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_snapchat_clone_full/screens/dashboard.dart';
import 'package:flutter_snapchat_clone_full/utils/colors.dart';
import 'package:flutter_snapchat_clone_full/utils/extensions.dart';
import 'package:flutter_snapchat_clone_full/utils/images.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    finish(context);
    launchScreen(context, Dashboard.tag);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Yellow,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              logo,
              width: animation.value * 250,
              height: animation.value * 250,
            ),
          ),
        ],
      ),
    );
  }
}
