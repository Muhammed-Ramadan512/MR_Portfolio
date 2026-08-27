import 'package:flutter/material.dart';
import '../constants.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard({
    Key? key,
    required this.index,
    required this.isSkillHover,
    required this.maxRadius,
    required this.paddingRight,
    required this.paddingleft,
    required this.skills,
  }) : super(key: key);

  final int index;
  final int isSkillHover;
  final double paddingRight;
  final double maxRadius;
  final double paddingleft;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    final hovered = index == isSkillHover;

    return Padding(
      padding: EdgeInsets.only(right: paddingRight, left: paddingleft),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: hovered
            ? (Matrix4.identity()..translate(0.0, -5.0, 0.0))
            : Matrix4.identity(),
        child: Container(
          width: maxRadius * 2.3,
          height: maxRadius * 2.3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: hovered
                  ? [Colors.amber, kprimaryColor]
                  : [Colors.white24, Colors.white12],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: hovered
                ? [
                    BoxShadow(
                      color: Colors.amber.withValues(alpha: 0.4),
                      blurRadius: 16,
                      spreadRadius: 2,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          padding: const EdgeInsets.all(3),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: hovered ? Colors.amber : const Color(0xff161f30),
            ),
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                skills[index],
                textAlign: TextAlign.center,
                maxLines: 3,
                style: TextStyle(
                  fontSize: maxRadius > 45 ? 13 : 11,
                  color: hovered ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                  height: 1.25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
