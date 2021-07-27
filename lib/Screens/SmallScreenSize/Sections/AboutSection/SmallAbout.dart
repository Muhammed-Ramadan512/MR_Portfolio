import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../Provider/AllProvider.dart';

class SmallAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final allProvider = Provider.of<AllProvider>(context);
    final height = MediaQuery.of(context).size.height;

    final style1 = TextStyle(
        color: Color(0xffA1A1A1),
        fontWeight: FontWeight.bold,
        fontSize: 17 //width * .027, //width * .012,
        );
    final style2 = TextStyle(
      fontSize: 17, //width * .027,
      fontWeight: FontWeight.w500,
    );

    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * .06,
          vertical: 30,
        ),
        height: height * 1.5,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: 450, //width * .7,
                  //minWidth:
                ),
                width: 450, //width * .7, //width * .27,
                //height: height * .47,
                child: Image.asset(
                  'assets/images/about.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(TextSpan(
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          fontFamily: "Zona",
                          color: kprimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: width * .04),
                      children: [
                        TextSpan(
                            text: 'flutter  '.toUpperCase(),
                            style: TextStyle(color: Colors.amber)),
                        TextSpan(
                            text: 'developer'.toUpperCase(),
                            style: TextStyle(color: kprimaryColor))
                      ])),
                  SizedBox(
                    height: height * .03,
                  ),
                  Container(
                    child: Text.rich(
                      TextSpan(
                          style: TextStyle(
                              fontSize: 18 //width * .03
                              ,
                              height: 1.5),
                          children: [
                            TextSpan(text: "I am "),
                            TextSpan(
                                text: "Mohamed Rmadan.",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18, //width * .035
                                )),
                            TextSpan(
                                text:
                                    "Flutter developer with great ambition to continue developing my skills and aspire to work on interesting projects ."),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'I have vast experience in Flutter, Dart, Firebase, Dealing with API and I have perfect knowledge of  HTML, HTML5, CSS, CSS3, Javascript .',
                    style: TextStyle(
                        fontSize: 18 //width * .03
                        ,
                        height: 1.5),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "Name : ", style: style1),
                        TextSpan(text: "Mohamed Ramadan", style: style2),
                      ])),
                      SizedBox(
                        height: 22,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "Email : ", style: style1),
                        TextSpan(
                            text: "mohamedRamadan949@gmail.com", style: style2),
                      ])),
                      SizedBox(
                        height: 22,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "Phone : ", style: style1),
                        TextSpan(text: "+2 01013691369", style: style2),
                      ])),
                      SizedBox(
                        height: 22,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "Address: ", style: style1),
                        TextSpan(text: "Egypt, Cairo", style: style2),
                      ])),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlineButton(
                        color: Colors.grey.withOpacity(.5),
                        borderSide: BorderSide(color: Colors.white),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 25),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        hoverColor: kprimaryColor.withOpacity(.1),
                        onPressed: () {
                          allProvider.controller.animateTo(
                              height - 90 + height * 1.5 + height * .5,
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(seconds: 1));
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/skills.png',
                              height: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'My Skills',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * .08,
                      ),
                      OutlineButton(
                        borderSide: BorderSide(color: Colors.white),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 25),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        hoverColor: kprimaryColor.withOpacity(.1),
                        onPressed: () {
                          Provider.of<AllProvider>(context, listen: false)
                              .downloadCv();
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/download.png',
                              height: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text('Download Cv',
                                style: TextStyle(fontWeight: FontWeight.w600))
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
