import 'package:flutter/material.dart';

class ProjectTitle extends StatelessWidget {
  const ProjectTitle({
    Key key,
    @required this.projectTitle,
  }) : super(key: key);

  final String projectTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      projectTitle,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
