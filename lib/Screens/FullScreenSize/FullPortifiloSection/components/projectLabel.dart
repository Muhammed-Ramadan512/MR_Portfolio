import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ProjectLables extends StatelessWidget {
  const ProjectLables({
    Key key,
    this.labelName,
    this.color,
    this.textColor,
    this.showMoreindex,
    this.projectIndex,
  }) : super(key: key);
  final String labelName;
  final Color color;
  final Color textColor;
  final int showMoreindex;
  final int projectIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color == null
            ? kprimaryColor
            : showMoreindex == projectIndex
                ? Colors.black
                : Colors.amber,
      ),
      child: Text(
        labelName,
        style: TextStyle(
            color: color == null
                ? Colors.black
                : showMoreindex == projectIndex
                    ? Colors.white
                    : Colors.black),
      ),
    );
  }
}
