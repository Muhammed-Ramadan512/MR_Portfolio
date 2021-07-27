import 'package:flutter/material.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import 'package:mr_portofilo/Provider/AllProvider.dart';
import 'package:mr_portofilo/Provider/Projects.dart';
import 'package:mr_portofilo/Screens/FullScreenSize/FullPortifiloSection/components/PortofiloBG.dart';
import 'package:mr_portofilo/Screens/FullScreenSize/FullPortifiloSection/components/PortofiloTitle.dart';
import 'package:mr_portofilo/Screens/FullScreenSize/FullPortifiloSection/components/projectLabel.dart';
import 'package:mr_portofilo/Screens/FullScreenSize/FullPortifiloSection/components/projectSubtitle.dart';
import 'package:mr_portofilo/Screens/FullScreenSize/FullPortifiloSection/components/projectTitle.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';

class SmallPortoFolio extends StatefulWidget {
  @override
  _SmallPortoFolioState createState() => _SmallPortoFolioState();
}

class _SmallPortoFolioState extends State<SmallPortoFolio> {
  List pindex = [];
  ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isinit = true;

  double scroolIndex = 0;
  int indexOfShowMore;
  @override
  void didChangeDependencies() {
    if (isinit) {
      final allProjects = Provider.of<AllProjects>(context);

      pindex = List.generate(allProjects.allProjects.length, (index) => 0);
    }
    setState(() {
      isinit = false;
    });

    super.didChangeDependencies();
  }

  Color seeMore = Colors.amber;
  Color seeMoreText = Colors.black;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final allProjects = Provider.of<AllProjects>(context);
    final allProvider = Provider.of<AllProvider>(context);

    return Stack(
      children: [
        BgImage(height: height, width: width),
        Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            height: height * 1.3,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  PortofiloTitle(),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        splashColor: kprimaryColor,
                        color: Colors.amber,
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        hoverColor: Colors.white,
                        onPressed: () {
                          if (!controller.position.atEdge)
                            setState(() {
                              scroolIndex = scroolIndex + 250;
                            });
                          else {
                            setState(() {
                              scroolIndex = controller.position.maxScrollExtent;
                            });
                          }

                          controller.animateTo(scroolIndex.toDouble(),
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(seconds: 1));
                        },
                        iconSize: 30,
                      ),
                      Expanded(
                        child: Container(
                          height: 450,
                          child: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              controller: controller,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ...List.generate(
                                        allProjects.allProjects.length,
                                        (pIndex) {
                                      //pindex = List.generate(4, (index) => 0);
                                      return Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 27),
                                        elevation: 7,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Container(
                                            width: 260,
                                            height: 400,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 200,
                                                  child: PageView.builder(
                                                    onPageChanged: (i) {
                                                      setState(() {
                                                        pindex[pIndex] = i;
                                                      });
                                                    },
                                                    itemCount: allProjects
                                                        .allProjects[pIndex]
                                                        .images
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Container(
                                                      color: Color(0xff3D3D3D)
                                                          .withOpacity(
                                                              .5), //Colors.transparent,
                                                      child: Image.asset(
                                                        allProjects
                                                            .allProjects[pIndex]
                                                            .images[index],
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                PageViewIndicator(
                                                  length: allProjects
                                                      .allProjects[pIndex]
                                                      .images
                                                      .length,
                                                  currentIndex: pindex[pIndex],
                                                  currentItemColor:
                                                      Colors.amber,
                                                  otherItemColor: Colors
                                                      .black, //Colors.grey.shade800,
                                                  currentItemWidth: 15,
                                                  currentItemHeight: 15,
                                                  otherItemWidth: 15,
                                                  otherItemHeight: 15,
                                                  indicatorMargin:
                                                      EdgeInsets.all(5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9999),
                                                  alignment:
                                                      MainAxisAlignment.center,
                                                  animationDuration: Duration(
                                                      milliseconds: 200),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 15),
                                                    width: double.infinity,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ProjectTitle(
                                                            projectTitle:
                                                                allProjects
                                                                    .allProjects[
                                                                        pIndex]
                                                                    .tilte),
                                                        ProjectSubtitle(
                                                            projectSubTitle:
                                                                allProjects
                                                                    .allProjects[
                                                                        pIndex]
                                                                    .subTitle),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Row(
                                                                    children: [
                                                                      ...List.generate(
                                                                          allProjects
                                                                              .allProjects[
                                                                                  pIndex]
                                                                              .labels
                                                                              .length,
                                                                          (labelIndex) =>
                                                                              ProjectLables(labelName: allProjects.allProjects[pIndex].labels[labelIndex]))
                                                                    ]),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onHover: (i) {
                                                                if (i == true) {
                                                                  setState(() {
                                                                    indexOfShowMore =
                                                                        pIndex;
                                                                    seeMore =
                                                                        Colors
                                                                            .black;
                                                                    seeMoreText =
                                                                        Colors
                                                                            .amber;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    indexOfShowMore =
                                                                        null;
                                                                    seeMore =
                                                                        Colors
                                                                            .amber;
                                                                    seeMoreText =
                                                                        Colors
                                                                            .black;
                                                                  });
                                                                }
                                                              },
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              onTap: () {
                                                                allProvider.projects(
                                                                    url: allProjects
                                                                        .allProjects[
                                                                            pIndex]
                                                                        .link);
                                                              },
                                                              child: ProjectLables(
                                                                  projectIndex:
                                                                      pIndex,
                                                                  showMoreindex:
                                                                      indexOfShowMore,
                                                                  labelName:
                                                                      "See More",
                                                                  color:
                                                                      seeMore,
                                                                  textColor:
                                                                      seeMoreText),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (scroolIndex > 300) {
                            setState(() {
                              scroolIndex = scroolIndex - 300;
                            });
                          } else {
                            setState(() {
                              scroolIndex = 0;
                            });
                          }

                          controller.animateTo(scroolIndex.toDouble(),
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(seconds: 1));
                        },
                        splashColor: kprimaryColor,
                        color: Colors.amber,
                        icon: Icon(
                          Icons.arrow_forward,
                        ),
                        hoverColor: Colors.white,
                        iconSize: 30,
                      ),
                    ],
                  )
                ],
              ),
            )),
      ],
    );
  }
}
