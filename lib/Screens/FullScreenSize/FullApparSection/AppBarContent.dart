import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../Provider/AllProvider.dart';
import '../../../Widgets/SocialIcon.dart';

class AppBarContnet extends StatefulWidget {
  @override
  _AppBarContnetState createState() => _AppBarContnetState();
}

class _AppBarContnetState extends State<AppBarContnet> {
  int menuIndex = 0;
  int hover;

  final Color hoverColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final allProvider = Provider.of<AllProvider>(context);

    final height = MediaQuery.of(context).size.height;

    return AnimatedContainer(
        duration: Duration(seconds: 15),
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg.jpg',
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Center(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * .23,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      padding: EdgeInsets.all(4),
                      child: CircleAvatar(
                        maxRadius: 100,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/images/profileImage.PNG'),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: "I'\m ",
                            style: TextStyle(
                                fontFamily: "BW",
                                fontSize: 50,
                                color: Colors.amber //height * 0.07
                                )),
                        TextSpan(
                            text: "Mohamed",
                            style: TextStyle(
                                fontFamily: "BW",
                                fontSize: 50, //height * 0.07,
                                color: Color(0xff00B0DC)))
                      ]),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TypewriterAnimatedTextKit(
                      speed: Duration(milliseconds: 100),
                      totalRepeatCount: 4,
                      text: ["Flutter Developer", "Ios / Android Developer"],
                      textStyle: TextStyle(
                          fontSize: 25.0,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                      pause: Duration(milliseconds: 40),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialIcon(
                          icon: FontAwesomeIcons.facebookF,
                          onTap: () {
                            allProvider.fb();
                          },
                        ),
                        SocialIcon(
                          icon: FontAwesomeIcons.linkedinIn,
                          onTap: () {
                            allProvider.linkedIn();
                          },
                        ),
                        SocialIcon(
                          icon: FontAwesomeIcons.github,
                          onTap: () {
                            allProvider.gitHub();
                          },
                        ),
                        SocialIcon(
                          icon: FontAwesomeIcons.instagram,
                          onTap: () {
                            allProvider.insat();
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
