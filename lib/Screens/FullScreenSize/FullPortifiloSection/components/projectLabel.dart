import 'package:flutter/material.dart';
import '../../../../constants.dart';

class ProjectLables extends StatelessWidget {
  const ProjectLables({
    Key? key,
    required this.labelName,
    this.color,
    this.textColor,
    this.showMoreindex,
    this.projectIndex,
  }) : super(key: key);

  final String labelName;
  final Color? color;
  final Color? textColor;
  final int? showMoreindex;
  final int? projectIndex;

  @override
  Widget build(BuildContext context) {
    final isShowMore = projectIndex != null && showMoreindex != null;
    final isHovered = isShowMore && showMoreindex == projectIndex;

    Color bg;
    Color fg;

    if (isShowMore) {
      bg = isHovered ? Colors.amber : kprimaryColor.withValues(alpha: 0.2);
      fg = isHovered ? Colors.black : kprimaryColor;
    } else {
      bg = kprimaryColor.withValues(alpha: 0.15);
      fg = kprimaryColor;
    }

    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color ?? bg,
        border: Border.all(
          color: (color != null ? Colors.amber : kprimaryColor).withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Text(
        labelName,
        style: TextStyle(
          color: textColor ?? fg,
          fontWeight: FontWeight.w600,
          fontSize: 12,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
