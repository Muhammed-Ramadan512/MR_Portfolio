import 'package:flutter/material.dart';
import '../constants.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    required this.isHover,
    required this.index,
    required this.height,
    required this.width,
    required this.maxRadius,
  }) : super(key: key);

  final int isHover;
  final int index;
  final double height;
  final double width;
  final double maxRadius;

  @override
  Widget build(BuildContext context) {
    final hovered = isHover == index;
    final item = serviceItems[index % serviceItems.length];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
      transform: hovered
          ? (Matrix4.identity()..translate(0.0, -6.0, 0.0))
          : Matrix4.identity(),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xff161f30),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: hovered
              ? kprimaryColor
              : Colors.white.withValues(alpha: 0.08),
          width: hovered ? 2 : 1,
        ),
        boxShadow: hovered
            ? [
                BoxShadow(
                  color: item.gradient.first.withValues(alpha: 0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: hovered
                    ? [Colors.amber, kprimaryColor]
                    : item.gradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: (hovered ? Colors.amber : item.gradient.first)
                      .withValues(alpha: 0.4),
                  blurRadius: 14,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              item.icon,
              color: Colors.white,
              size: maxRadius * 0.95,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Center(
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width > 200 ? 15 : 13,
                  color: hovered ? Colors.amber : Colors.white,
                  letterSpacing: 0.3,
                  height: 1.35,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
