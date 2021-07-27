import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../Widgets/ServiceCard.dart';
import '../../../../Widgets/SkillCard.dart';

class SmallService extends StatefulWidget {
  @override
  _SmallServiceState createState() => _SmallServiceState();
}

class _SmallServiceState extends State<SmallService> {
  int isHover;
  int isSkillHover_1;
  int isSkillHover_2;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Image.asset(
        'assets/images/recent_work_bg.png',
        fit: BoxFit.cover,
        height: height * 1.2,
        width: double.infinity,
        // color: kprimaryColor.withOpacity(.1),
      ),
      Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          margin: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          height: MediaQuery.of(context).size.height * 1.2,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text.rich(TextSpan(
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    children: [
                      TextSpan(
                          text: "My Offeri",
                          style: TextStyle(color: Colors.amber)),
                      TextSpan(
                          text: "ng Services",
                          style: TextStyle(color: kprimaryColor))
                    ])),
                SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        4,
                        (index) => InkWell(
                          onTap: () {},
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onHover: (value) {
                            if (value) {
                              setState(() {
                                isHover = index;
                              });
                            } else {
                              setState(() {
                                isHover = null;
                              });
                            }
                          },
                          child: ServiceCard(
                            maxRadius: 50,
                            width: 173,
                            height: 173,
                            isHover: isHover,
                            index: index,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  // color: Colors.black.withOpacity(.8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text.rich(TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                            children: [
                              TextSpan(
                                  text: "My ",
                                  style: TextStyle(color: Colors.amber)),
                              TextSpan(
                                  text: "Skills",
                                  style: TextStyle(color: kprimaryColor))
                            ])),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Container(
                            child: SingleChildScrollView(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ...List.generate(
                                          5,
                                          (index) => InkWell(
                                                highlightColor:
                                                    Colors.transparent,
                                                splashColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                onTap: () {},
                                                onHover: (val) {
                                                  if (val) {
                                                    setState(() {
                                                      isSkillHover_1 = index;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      isSkillHover_1 = null;
                                                    });
                                                  }
                                                },
                                                child: SkillsCard(
                                                    skills: skills_1,
                                                    maxRadius: 50,
                                                    paddingRight: 50,
                                                    index: index,
                                                    isSkillHover:
                                                        isSkillHover_1),
                                              ))
                                    ],
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceEvenly,
                                      children: List.generate(
                                          4,
                                          (index) => InkWell(
                                                highlightColor:
                                                    Colors.transparent,
                                                splashColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                onTap: () {},
                                                onHover: (val) {
                                                  if (val) {
                                                    setState(() {
                                                      isSkillHover_2 = index;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      isSkillHover_2 = null;
                                                    });
                                                  }
                                                },
                                                child: SkillsCard(
                                                    skills: skills_2,
                                                    paddingleft: 65,
                                                    maxRadius: 50,
                                                    index: index,
                                                    isSkillHover:
                                                        isSkillHover_2),
                                              )))
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ))
    ]);
  }
}
