import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mr_portofilo/Provider/AllProvider.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class FullContact extends StatefulWidget {
  @override
  _FullContactState createState() => _FullContactState();
}

class _FullContactState extends State<FullContact> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final allProvider = Provider.of<AllProvider>(context);

    return Stack(children: [
      Container(
        height: height,
        color: Colors.black.withOpacity(.9),
      ),
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 35,
            ),
            Text.rich(
              TextSpan(
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                        text: "Get In ", style: TextStyle(color: Colors.amber)),
                    TextSpan(
                        text: "Touch", style: TextStyle(color: kprimaryColor))
                  ]),
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Row(
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
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.black38,
              child: Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Made With ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  Text(
                    ' By',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    ' Mohamed Ramadan',
                    style: TextStyle(
                        color: kprimaryColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Beautiful",
                        letterSpacing: 2),
                  ),
                ]),
              ),
            )
          ],
        ),
      )
    ]);
  }
}

class ContactElemet extends StatefulWidget {
  ContactElemet({this.icon, this.title, this.onTap});
  final IconData icon;
  final String title;
  final Function onTap;

  @override
  _ContactElemetState createState() => _ContactElemetState();
}

class _ContactElemetState extends State<ContactElemet> {
  Color hoverIconColor = Colors.amber;
  Color hoverTextColor = kprimaryColor;
  bool ishover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: widget.onTap,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onHover: (x) {
          if (x) {
            setState(() {
              ishover = true;
            });
          } else {
            setState(() {
              ishover = false;
            });
          }
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color:
                      ishover ? hoverIconColor : Colors.black.withOpacity(.5),
                  shape: BoxShape.circle),
              padding: EdgeInsets.all(12),
              child: Icon(
                widget.icon,
                color: ishover ? Colors.black : Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              widget.title, textAlign: TextAlign.center, //,
              style: TextStyle(
                color: ishover ? hoverTextColor : Colors.white70,
              ),
            )
          ],
        ),
      ),
    );
  }
}
