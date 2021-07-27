import '../../../Provider/AllProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class AboutInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final allProvider = Provider.of<AllProvider>(context);

    final style1 = TextStyle(
      color: Color(0xffA1A1A1),
      fontWeight: FontWeight.bold,
      fontSize: 19,
      // decoration: TextDecoration.underline,
      // decorationStyle:
      //     TextDecorationStyle.double //width * .014, //width * .012,
    );
    final style2 = TextStyle(
      fontSize: 19, //width * .014,
      fontWeight: FontWeight.w500,
    );

    return Expanded(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(TextSpan(
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        fontFamily: "Zona",
                        color: kprimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ), //width * .02),
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
                          fontSize: 19, //width * .017,
                          height: 1.5),
                      children: [
                        TextSpan(text: "I am "),
                        TextSpan(
                            text: "Mohamed Rmadan.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18, //width * .016
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
                    fontSize: 19,
                    //width * .017,
                    height: 1.5),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                          2 * height - 220 + ((1.5 * height) / 2),
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
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
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
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
