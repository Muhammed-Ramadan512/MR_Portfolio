import 'package:flutter/material.dart';

class ProjectTitle extends StatelessWidget {
  const ProjectTitle({
    Key? key,
    required this.projectTitle,
  }) : super(key: key);

  final String projectTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      projectTitle,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        letterSpacing: 0.5,
      ),
    );
  }
}
