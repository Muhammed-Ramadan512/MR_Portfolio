import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../Widgets/ServiceCard.dart';
import '../../../Widgets/SkillCard.dart';

class FullServices extends StatefulWidget {
  @override
  _FullServicesState createState() => _FullServicesState();
}

class _FullServicesState extends State<FullServices> {
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
        height: height * 1.3,
        width: double.infinity,
        // color: kprimaryColor.withOpacity(.1),
        repeat: ImageRepeat.noRepeat,
      ),
      Container(
          padding: EdgeInsets.symmetric(vertical: height * .02),
          margin: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          height: MediaQuery.of(context).size.height * 1.3,
          width: double.infinity,
          child: SingleChildScrollView(
            //physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text.rich(TextSpan(
                    style: Theme.of(context).textTheme.headline2.copyWith(
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
                                  maxRadius: 80,
                                  width: 230,
                                  height: 230,
                                  isHover: isHover,
                                  index: index,
                                ),
                              )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(TextSpan(
                          style: Theme.of(context).textTheme.headline2.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          children: [
                            TextSpan(
                                text: "My ",
                                style: TextStyle(color: Colors.amber)),
                            TextSpan(
                                text: "Skills",
                                style: TextStyle(color: kprimaryColor))
                          ])),
                      SizedBox(
                        height: 35,
                      ),
                      SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ...List.generate(
                                    5,
                                    (index) => InkWell(
                                          highlightColor: Colors.transparent,
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
                                              maxRadius: 65,
                                              paddingRight: 65,
                                              index: index,
                                              isSkillHover: isSkillHover_1),
                                        ))
                              ],
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                    4,
                                    (index) => InkWell(
                                          highlightColor: Colors.transparent,
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
                                              maxRadius: 65,
                                              paddingleft: 85,
                                              index: index,
                                              isSkillHover: isSkillHover_2),
                                        )))
                          ],
                        ),
                      )
                    ]),
              ],
            ),
          ))
    ]);
  }
}
