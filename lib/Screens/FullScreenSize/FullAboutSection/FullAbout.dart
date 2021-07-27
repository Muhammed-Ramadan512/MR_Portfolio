import 'package:flutter/material.dart';

import './image.dart';

import './Info.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

        //margin: EdgeInsets.symmetric(horizontal: width * .005),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
        ),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AboutImage(),
            SizedBox(
              width: 30,
            ),
            AboutInfo(),
            SizedBox(
              width: 10,
            ),
            // SizedBox(
            //   width: width * .05,
            // ),
          ],
        ));
  }
}
