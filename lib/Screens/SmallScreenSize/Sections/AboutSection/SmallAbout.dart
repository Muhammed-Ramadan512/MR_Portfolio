import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../Provider/AllProvider.dart';
import '../../../../constants.dart';

class SmallAbout extends StatelessWidget {
  const SmallAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allProvider = Provider.of<AllProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    const styleLabel = TextStyle(
      color: Color(0xff94a3b8),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    const styleVal = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return Container(
      width: double.infinity,
      color: const Color(0xff0b0f19),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.06,
        vertical: 45,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // About Image
          Container(
            constraints: const BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/about.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 30),

          // About Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: "Zona",
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: 'SENIOR FLUTTER ',
                      style: TextStyle(color: Colors.amber),
                    ),
                    TextSpan(
                      text: 'DEVELOPER',
                      style: TextStyle(color: kprimaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Badges
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildBadge("5+ Years Exp", Colors.amber),
                  _buildBadge("100+ Released Apps", kprimaryColor),
                  _buildBadge("176+ Clients", const Color(0xff10b981)),
                ],
              ),

              const SizedBox(height: 16),
              const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    color: Colors.white70,
                  ),
                  children: [
                    TextSpan(text: "I am "),
                    TextSpan(
                      text: "Mohamed Ramadan. ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text:
                          "Senior Mobile Engineer with 5+ years of experience architecting, releasing, and operating production Android and iOS applications. Architect of a multi-tenant white-label EdTech/LMS platform supporting 176+ client configurations.",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Expert in Clean Architecture, CI/CD automation with Fastlane & GitHub Actions, SSL Pinning, WebSockets, DRM offline media, and payments.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: Colors.white60,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xff161f30),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
                child: Column(
                  children: [
                    _buildInfoRow("Role :", "Senior Flutter Developer", styleLabel, styleVal),
                    const SizedBox(height: 8),
                    _buildInfoRow("Experience :", "VClasses | 2021 - Present", styleLabel, styleVal),
                    const SizedBox(height: 8),
                    _buildInfoRow("Education :", "B.Sc. IT, Helwan Univ (Very Good)", styleLabel, styleVal),
                    const SizedBox(height: 8),
                    _buildInfoRow("Email :", "mohamedRamadan949@gmail.com", styleLabel, styleVal),
                    const SizedBox(height: 8),
                    _buildInfoRow("Phone :", "+20 01013691369", styleLabel, styleVal),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: kprimaryColor.withValues(alpha: 0.12),
                      side: const BorderSide(color: kprimaryColor, width: 1.5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      allProvider.animateSmall(height: height, index: 2);
                    },
                    icon: Image.asset(
                      'assets/images/skills.png',
                      height: 18,
                    ),
                    label: const Text(
                      'Core Skills',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.amber.withValues(alpha: 0.12),
                      side: const BorderSide(color: Colors.amber, width: 1.5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      allProvider.downloadCv();
                    },
                    icon: Image.asset(
                      'assets/images/download.png',
                      height: 18,
                    ),
                    label: const Text(
                      'Download CV',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 11,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildInfoRow(
      String label, String value, TextStyle styleLabel, TextStyle styleVal) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(label, style: styleLabel),
        ),
        Expanded(
          child: Text(value, style: styleVal),
        ),
      ],
    );
  }
}
