import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../Provider/AllProvider.dart';
import '../../../Widgets/SocialIcon.dart';
import '../../../constants.dart';

class AppBarContnet extends StatelessWidget {
  const AppBarContnet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allProvider = Provider.of<AllProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff0b0f19).withValues(alpha: 0.82),
                    const Color(0xff0b0f19).withValues(alpha: 0.96),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  // Profile avatar with glowing gradient frame
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Colors.amber, kprimaryColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kprimaryColor.withValues(alpha: 0.35),
                          blurRadius: 25,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(4),
                    child: ClipOval(
                      child: Container(
                        width: (width < 600 ? 70.0 : 90.0) * 2,
                        height: (width < 600 ? 70.0 : 90.0) * 2,
                        color: const Color(0xff161f30),
                        child: Image.asset(
                          'assets/images/profileImage.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/about.png',
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: "I'm ",
                        style: TextStyle(
                          fontFamily: "BW",
                          fontSize: 48,
                          color: Colors.amber,
                        ),
                      ),
                      TextSpan(
                        text: "Mohamed Ramadan",
                        style: TextStyle(
                          fontFamily: "BW",
                          fontSize: 48,
                          color: kprimaryColor,
                        ),
                      )
                    ]),
                  ),
                  const SizedBox(height: 12),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontFamily: "Zona",
                      fontSize: width < 600 ? 18 : 24,
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Senior Flutter Developer',
                          speed: const Duration(milliseconds: 90),
                        ),
                        TypewriterAnimatedText(
                          'Senior Mobile Engineer (iOS & Android)',
                          speed: const Duration(milliseconds: 90),
                        ),
                        TypewriterAnimatedText(
                          'White-Label Platform Architect (176+ Clients)',
                          speed: const Duration(milliseconds: 90),
                        ),
                        TypewriterAnimatedText(
                          '100+ Production Apps on Stores',
                          speed: const Duration(milliseconds: 90),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIcon(
                        icon: FontAwesomeIcons.linkedinIn,
                        onTap: () => allProvider.linkedIn(),
                      ),
                      SocialIcon(
                        icon: FontAwesomeIcons.github,
                        onTap: () => allProvider.gitHub(),
                      ),
                      SocialIcon(
                        icon: FontAwesomeIcons.facebookF,
                        onTap: () => allProvider.fb(),
                      ),
                      SocialIcon(
                        icon: FontAwesomeIcons.instagram,
                        onTap: () => allProvider.insat(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
