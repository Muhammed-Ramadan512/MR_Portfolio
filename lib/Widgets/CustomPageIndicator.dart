import 'package:flutter/material.dart';

class CustomPageIndicator extends StatelessWidget {
  final int length;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;
  final double activeWidth;
  final double inactiveWidth;
  final double height;
  final Duration duration;

  const CustomPageIndicator({
    Key? key,
    required this.length,
    required this.currentIndex,
    this.activeColor = Colors.amber,
    this.inactiveColor = const Color(0xFF4A5568),
    this.activeWidth = 24.0,
    this.inactiveWidth = 10.0,
    this.height = 10.0,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: duration,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: height,
          width: isActive ? activeWidth : inactiveWidth,
          decoration: BoxDecoration(
            color: isActive ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(height / 2),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: activeColor.withValues(alpha: 0.5),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
        );
      }),
    );
  }
}
