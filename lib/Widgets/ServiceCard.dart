import 'package:flutter/material.dart';

import '../constants.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key key,
    @required this.isHover,
    this.index,
    this.height,
    this.width,
    this.maxRadius,
  }) : super(key: key);

  final int isHover;
  final int index;
  final double height;
  final double width;
  final double maxRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isHover == index ? 7 : 4,
      borderOnForeground: false,
      margin: EdgeInsets.all(15),
      color: servicesColors[index],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
          height: isHover == index ? height : height - 1, // 173 : 172,
          width: isHover == index ? width : width - 1,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: maxRadius,
                backgroundImage: AssetImage(
                  'assets/images/skill$index.png',
                ),
              ),
              Text(
                services[index],
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              )
            ],
          )),
    );
  }
}
