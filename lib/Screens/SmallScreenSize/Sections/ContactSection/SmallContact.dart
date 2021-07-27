import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mr_portofilo/Provider/AllProvider.dart';
import 'package:mr_portofilo/Screens/FullScreenSize/FullContactSection/FullContact.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';

class SmallContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final allProvider = Provider.of<AllProvider>(context);

    return Stack(children: [
      Container(
        height: height * 1.3,
        color: Colors.black.withOpacity(.9),
      ),
      Container(
        height: height * 1.3,
        child: Center(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Text.rich(
                  TextSpan(
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        TextSpan(
                            text: "Get In ",
                            style: TextStyle(color: Colors.amber)),
                        TextSpan(
                            text: "Touch",
                            style: TextStyle(color: kprimaryColor))
                      ]),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ContactElemet(
                        onTap: () {
                          allProvider.linkedIn();
                        },
                        title: 'Linkedin',
                        icon: FontAwesomeIcons.linkedinIn,
                      ),
                      ContactElemet(
                        onTap: () {
                          allProvider.fb();
                        },
                        title: 'FaceBook',
                        icon: FontAwesomeIcons.facebookF,
                      ),
                      ContactElemet(
                        onTap: () {},
                        title: 'mohamedramadan949@gmail.com',
                        icon: FontAwesomeIcons.mailBulk,
                      ),
                      ContactElemet(
                        onTap: () {
                          allProvider.insat();
                        },
                        title: 'Instagram',
                        icon: FontAwesomeIcons.instagram,
                      ),
                      ContactElemet(
                        onTap: () {},
                        title: '+2 01013691369',
                        icon: FontAwesomeIcons.phoneAlt,
                      ),
                      ContactElemet(
                        onTap: () {
                          allProvider.gitHub();
                        },
                        title: 'Github',
                        icon: FontAwesomeIcons.github,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
