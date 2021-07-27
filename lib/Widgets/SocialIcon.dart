import 'package:flutter/material.dart';

class SocialIcon extends StatefulWidget {
  SocialIcon({this.icon, this.onTap});
  final IconData icon;
  final Function onTap;
  @override
  _SocialIconState createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  Color hoverColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (x) {
        setState(() {
          hoverColor = x ? Color(0xff00B0DC) : Colors.transparent;
        });
      },
      focusColor: Colors.red,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white12,
            ),
            color: hoverColor),
        padding: EdgeInsets.all(7),
        child: Center(
            child: Icon(
          widget.icon,
          color: Colors.white,
          size: 22,
        )),
      ),
    );
  }
}
