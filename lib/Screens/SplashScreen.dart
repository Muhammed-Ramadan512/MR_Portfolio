import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

import '../constants.dart';
import 'HomeScreen/HomScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _splashTimer;

  @override
  void initState() {
    super.initState();
    _splashTimer = Timer(const Duration(milliseconds: 1800), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 600),
            child: const MyHomePage(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _splashTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b0f19),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: "M",
                  style: TextStyle(
                    letterSpacing: 2,
                    fontFamily: "Beautiful",
                    fontSize: 55,
                    color: Colors.amber,
                  ),
                ),
                TextSpan(
                  text: "R",
                  style: TextStyle(
                    fontFamily: "Beautiful",
                    fontSize: 55,
                    color: kprimaryColor,
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 30),
            SpinKitRipple(
              duration: const Duration(seconds: 2),
              borderWidth: 10,
              color: kprimaryColor,
              size: 130,
            ),
          ],
        ),
      ),
    );
  }
}
