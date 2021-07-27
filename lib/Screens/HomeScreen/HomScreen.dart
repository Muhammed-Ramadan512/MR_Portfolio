import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../Provider/AllProvider.dart';
import '../../Screens/FullScreenSize/FullScreen.dart';
import '../../Screens/SmallScreenSize/SmallScreen.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

import '../../Widgets/MenuItemSmallScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isinit = true;

  @override
  void didChangeDependencies() {
    if (isinit) {
      Provider.of<AllProvider>(
        context,
      ).setController();
    }
    setState(() {
      isinit = false;
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Provider.of<AllProvider>(context).disposeController();
    super.dispose();
  }

  int hover;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final allProvider = Provider.of<AllProvider>(context);

    return Scaffold(
        body: ResponsiveBuilder(
            builder: (context, sizingInformation) => Stack(children: [
                  SingleChildScrollView(
                    controller: allProvider.controller,
                    child: Column(children: [
                      if (sizingInformation.deviceScreenType ==
                              DeviceScreenType.desktop ||
                          sizingInformation.deviceScreenType ==
                              DeviceScreenType.tablet)
                        FullScreen()
                      else
                        Stack(children: [
                          SmallScreen(),
                          allProvider.menu
                              ? Positioned(
                                  top: allProvider.myScrool + 40,
                                  right: 10,
                                  left: 10,
                                  child: MenuItemSmallScreen())
                              : SizedBox(),
                        ])
                    ]),
                  ),
                  sizingInformation.deviceScreenType ==
                              DeviceScreenType.desktop ||
                          sizingInformation.deviceScreenType ==
                              DeviceScreenType.tablet
                      ? Container(
                          height: 95,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: allProvider.myScrool >= (height / 2) - 200
                                  ? Color(0xffF9F9F9)
                                  : Colors.transparent,
                              boxShadow: [
                                allProvider.myScrool > (height / 2) - 200
                                    ? BoxShadow(
                                        color: Colors.black.withOpacity(.3),
                                        blurRadius: 10,
                                        offset: Offset(0, 20))
                                    : BoxShadow(
                                        color: Colors.transparent,
                                        blurRadius: 0,
                                        offset: Offset(0, 0)),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                        text: "M",
                                        style: TextStyle(
                                            letterSpacing: 2,
                                            fontFamily: "Beautiful",
                                            fontSize: 45,
                                            color: Colors.amber //height * 0.07
                                            )),
                                    TextSpan(
                                        text: "R  ",
                                        style: TextStyle(
                                            fontFamily: "Beautiful",
                                            fontSize: 45, //height * 0.07,
                                            color: Color(0xff00B0DC)))
                                  ]),
                                ),
                              ),
                              Row(
                                  children: List.generate(
                                      menuItem.length,
                                      (index) => Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20),
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
                                              allProvider.animate(
                                                  index: index, height: height);
                                            },
                                            child: Text(
                                              menuItem[index].toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  // fontWeight: hover == index
                                                  //     ? FontWeight.w500
                                                  //     : null,
                                                  color: allProvider
                                                          .dynamicHover(
                                                              height: height,
                                                              index: index)
                                                      ? Color(0xff00B0DC)
                                                      : hover == index
                                                          ? Colors.amber
                                                          : allProvider
                                                                      .myScrool >
                                                                  MediaQuery.of(context)
                                                                              .size
                                                                              .height /
                                                                          2 -
                                                                      200
                                                              ? Colors.black
                                                              : Colors.white,
                                                  letterSpacing: 2),
                                            ),
                                          )))),
                            ],
                          ),
                        )
                      : Container(
                          height: 95,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: allProvider.myScrool >= (height / 2) - 200
                                  ? Color(0xffF9F9F9)
                                  : Colors.transparent,
                              boxShadow: [
                                allProvider.myScrool > (height / 2) - 200
                                    ? BoxShadow(
                                        color: Colors.black.withOpacity(.3),
                                        blurRadius: 10,
                                        offset: Offset(0, 20))
                                    : BoxShadow(
                                        color: Colors.transparent,
                                        blurRadius: 0,
                                        offset: Offset(0, 0)),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                        text: "M",
                                        style: TextStyle(
                                            fontFamily: "Beautiful",
                                            fontSize: 45,
                                            color: Colors.amber //height * 0.07
                                            )),
                                    TextSpan(
                                        text: "R  ",
                                        style: TextStyle(
                                            fontFamily: "Beautiful",
                                            fontSize: 45, //height * 0.07,
                                            color: Color(0xff00B0DC)))
                                  ]),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.listUl,
                                    color: allProvider.myScrool >
                                            (height / 2) - 200
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                  onPressed: () {
                                    allProvider.toggleMenu();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                ])));
  }
}
