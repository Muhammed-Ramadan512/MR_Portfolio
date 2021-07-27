import '../Provider/AllProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class MenuItemSmallScreen extends StatefulWidget {
  @override
  _MenuItemSmallScreenState createState() => _MenuItemSmallScreenState();
}

class _MenuItemSmallScreenState extends State<MenuItemSmallScreen> {
  int menuIndex = 0;
  int hover;
  @override
  Widget build(BuildContext context) {
    final allProvider = Provider.of<AllProvider>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final menuProvider = Provider.of<AllProvider>(context);
    return AnimatedContainer(
      height: height * .6,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.9),
          borderRadius: BorderRadius.circular(5)),
      duration: Duration(seconds: 7),
      curve: Curves.easeInCubic,
      margin: EdgeInsets.symmetric(
          horizontal: width * .08, vertical: height * .135),
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              menuItem.length,
              (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .07),
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    onHover: (val) {
                      setState(() {
                        if (val) {
                          hover = index;
                        } else {
                          hover = null;
                        }
                      });
                    },
                    onTap: () {
                      menuProvider.toggleMenu();
                      allProvider.animateSmall(height: height, index: index);

                      setState(() {
                        menuIndex = index;
                      });
                    },
                    child: Text(
                      menuItem[index].toUpperCase(),
                      style: TextStyle(
                          fontSize: height * .039,
                          color: allProvider.dynamicSmallHover(
                                  height: height, index: index)
                              ? Color(0xff00B0DC)
                              : hover == index
                                  ? Colors.amber
                                  : Colors.white,
                          letterSpacing: 2),
                    ),
                  )))),
    );
  }
}
