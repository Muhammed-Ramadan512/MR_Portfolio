import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/AllProvider.dart';
import '../constants.dart';

class MenuItemSmallScreen extends StatefulWidget {
  const MenuItemSmallScreen({Key? key}) : super(key: key);

  @override
  State<MenuItemSmallScreen> createState() => _MenuItemSmallScreenState();
}

class _MenuItemSmallScreenState extends State<MenuItemSmallScreen> {
  int? hover;

  @override
  Widget build(BuildContext context) {
    final allProvider = Provider.of<AllProvider>(context);
    final height = MediaQuery.of(context).size.height;

    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: const Color(0xff161f30).withValues(alpha: 0.96),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: kprimaryColor.withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.6),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          menuItem.length,
          (index) {
            final isSelected =
                allProvider.dynamicSmallHover(height: height, index: index);
            final isHovered = hover == index;

            return MouseRegion(
              onEnter: (_) => setState(() => hover = index),
              onExit: (_) => setState(() => hover = null),
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  allProvider.toggleMenu();
                  allProvider.animateSmall(height: height, index: index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? kprimaryColor.withValues(alpha: 0.2)
                        : (isHovered
                            ? Colors.white.withValues(alpha: 0.06)
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        menuItem[index].toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected
                              ? kprimaryColor
                              : (isHovered ? Colors.amber : Colors.white),
                          letterSpacing: 2,
                        ),
                      ),
                      if (isSelected)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kprimaryColor,
                          ),
                        )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
