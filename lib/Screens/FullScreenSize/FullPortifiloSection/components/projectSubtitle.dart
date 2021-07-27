import 'package:flutter/material.dart';

class ProjectSubtitle extends StatelessWidget {
  const ProjectSubtitle({
    Key key,
    @required this.projectSubTitle,
  }) : super(key: key);

  final String projectSubTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      projectSubTitle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.w500),
    );
  }
}
