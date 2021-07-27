import 'package:flutter/material.dart';

class AboutImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400, //width * .27,
      //height: height * .47,
      child: Image.asset(
        'assets/images/about.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
