import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

import '../constants.dart';
import './HomeScreen/HomScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer splashTimer;
  @override
  void initState() {
    splashTimer = Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 500),
            child: MyHomePage(),
            inheritTheme: true,
            ctx: context),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SpinKitRipple(
      duration: Duration(seconds: 3),
      borderWidth: 25,
      color: kprimaryColor,
      size: 200,
    );
  }
}
