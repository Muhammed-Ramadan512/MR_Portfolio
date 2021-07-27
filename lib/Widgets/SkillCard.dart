import 'package:flutter/material.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard({
    Key key,
    this.index,
    this.isSkillHover,
    this.maxRadius,
    this.paddingRight,
    this.paddingleft,
    this.skills,
  }) : super(key: key);
  final int index;
  final int isSkillHover;
  final double paddingRight;
  final double maxRadius;
  final double paddingleft;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
          right: paddingRight != null ? paddingRight : 0,
          left: paddingleft != null ? paddingleft : 0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(maxRadius)),
      elevation: 8,
      child: CircleAvatar(
        maxRadius: maxRadius,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          backgroundColor: Color(0xffBCBCBC),
          maxRadius: maxRadius - 3,
          child: CircleAvatar(
            backgroundColor: index == isSkillHover
                ? Colors.amber
                : Colors.black.withOpacity(.8),
            maxRadius: maxRadius - 9,
            child: Text(
              skills[index],
              style: TextStyle(
                  fontSize: 16,
                  color: index == isSkillHover
                      ? Colors.black
                      : Colors.amberAccent, //Color(0xffF6E700),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
