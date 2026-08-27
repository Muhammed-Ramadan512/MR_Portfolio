import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../Provider/AllProvider.dart';
import '../../Screens/FullScreenSize/FullScreen.dart';
import '../../Screens/SmallScreenSize/SmallScreen.dart';
import '../../Widgets/MenuItemSmallScreen.dart';
import '../../constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isInit = true;
  int? _hoverIndex;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<AllProvider>(context, listen: false).setController();
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final allProvider = Provider.of<AllProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff0b0f19),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          final isDesktop = sizingInformation.deviceScreenType ==
                  DeviceScreenType.desktop ||
              sizingInformation.deviceScreenType == DeviceScreenType.tablet;

          final isScrolled = allProvider.myScrool > 80;

          return Stack(
            children: [
              SingleChildScrollView(
                controller: allProvider.controller,
                child: isDesktop ? const FullScreen() : const SmallScreen(),
              ),

              // Sticky Mobile Dropdown Menu (Always visible at top of viewport when open)
              if (!isDesktop && allProvider.menu)
                Positioned(
                  top: 85,
                  right: 20,
                  left: 20,
                  child: const Center(
                    child: MenuItemSmallScreen(),
                  ),
                ),

              // Modern Floating / Sticky Top Navigation Bar
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: isScrolled
                        ? const Color(0xff101726).withValues(alpha: 0.92)
                        : Colors.transparent,
                    border: Border(
                      bottom: BorderSide(
                        color: isScrolled
                            ? Colors.white.withValues(alpha: 0.08)
                            : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    boxShadow: isScrolled
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.4),
                              blurRadius: 15,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : [],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Brand Logo
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            if (isDesktop) {
                              allProvider.animate(index: 0, height: height);
                            } else {
                              allProvider.animateSmall(index: 0, height: height);
                            }
                          },
                          child: const Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                text: "M",
                                style: TextStyle(
                                  letterSpacing: 2,
                                  fontFamily: "Beautiful",
                                  fontSize: 42,
                                  color: Colors.amber,
                                ),
                              ),
                              TextSpan(
                                text: "R",
                                style: TextStyle(
                                  fontFamily: "Beautiful",
                                  fontSize: 42,
                                  color: kprimaryColor,
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),

                      // Desktop Navigation Links
                      if (isDesktop)
                        Row(
                          children: List.generate(
                            menuItem.length,
                            (index) {
                              final isCurrent = allProvider.dynamicHover(
                                height: height,
                                index: index,
                              );
                              final isHover = _hoverIndex == index;

                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: MouseRegion(
                                  onEnter: (_) =>
                                      setState(() => _hoverIndex = index),
                                  onExit: (_) =>
                                      setState(() => _hoverIndex = null),
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      allProvider.animate(
                                        index: index,
                                        height: height,
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          menuItem[index].toUpperCase(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: isCurrent
                                                ? FontWeight.bold
                                                : FontWeight.w500,
                                            color: isCurrent
                                                ? kprimaryColor
                                                : (isHover
                                                    ? Colors.amber
                                                    : Colors.white),
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          height: 2,
                                          width: isCurrent
                                              ? 24
                                              : (isHover ? 16 : 0),
                                          decoration: BoxDecoration(
                                            color: isCurrent
                                                ? kprimaryColor
                                                : Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      else
                        IconButton(
                          icon: Icon(
                            allProvider.menu
                                ? FontAwesomeIcons.xmark
                                : FontAwesomeIcons.bars,
                            color: Colors.white,
                            size: 22,
                          ),
                          onPressed: () {
                            allProvider.toggleMenu();
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
