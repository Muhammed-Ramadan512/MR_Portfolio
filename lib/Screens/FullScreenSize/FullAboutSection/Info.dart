import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Provider/AllProvider.dart';
import '../../../constants.dart';

class AboutInfo extends StatelessWidget {
  const AboutInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final allProvider = Provider.of<AllProvider>(context);

    const styleLabel = TextStyle(
      color: Color(0xff94a3b8),
      fontWeight: FontWeight.bold,
      fontSize: 15,
      letterSpacing: 0.5,
    );
    const styleVal = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: "Zona",
                fontWeight: FontWeight.bold,
                fontSize: 26,
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
          const SizedBox(height: 16),

          // Key Highlights Metric Badges
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              _buildBadge("5+ Years Experience", Colors.amber),
              _buildBadge("100+ Production Apps on Stores", kprimaryColor),
              _buildBadge("176+ White-Label Tenants", const Color(0xff10b981)),
            ],
          ),

          const SizedBox(height: 18),
          const Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 16,
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
                      "Senior Mobile Engineer with 5+ years of experience architecting, releasing, and operating production Android and iOS applications. Leading a multi-tenant white-label EdTech/LMS platform supporting 176+ client configurations from a unified Flutter codebase with 100+ store releases.",
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Expertise across Clean Architecture, CI/CD automation (Fastlane & GitHub Actions), mobile security (SPKI SSL Pinning & freeRASP), WebSockets, DRM offline media, and multi-gateway payments.',
            style: TextStyle(
              fontSize: 15,
              height: 1.6,
              color: Colors.white60,
            ),
          ),
          const SizedBox(height: 20),

          // Details Card
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xff161f30),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
            child: Column(
              children: [
                _buildInfoRow("Role :", "Senior Flutter Developer | Mobile Engineer", styleLabel, styleVal),
                const SizedBox(height: 10),
                _buildInfoRow("Experience :", "VClasses (Lead Mobile) | 2021 - Present", styleLabel, styleVal),
                const SizedBox(height: 10),
                _buildInfoRow("Education :", "B.Sc. Computer & Information Science, Helwan Univ (Very Good)", styleLabel, styleVal),
                const SizedBox(height: 10),
                _buildInfoRow("Location :", "Cairo, Egypt", styleLabel, styleVal),
                const SizedBox(height: 10),
                _buildInfoRow("Email :", "mohamedRamadan949@gmail.com", styleLabel, styleVal),
                const SizedBox(height: 10),
                _buildInfoRow("Phone :", "+20 01013691369", styleLabel, styleVal),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: kprimaryColor.withValues(alpha: 0.12),
                  side: const BorderSide(color: kprimaryColor, width: 1.5),
                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  allProvider.animate(index: 2, height: height);
                },
                icon: Image.asset(
                  'assets/images/skills.png',
                  height: 22,
                ),
                label: const Text(
                  'Core Skills',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.amber.withValues(alpha: 0.12),
                  side: const BorderSide(color: Colors.amber, width: 1.5),
                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  allProvider.downloadCv();
                },
                icon: Image.asset(
                  'assets/images/download.png',
                  height: 22,
                ),
                label: const Text(
                  'Download Full CV',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.amber,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 12,
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
          width: 110,
          child: Text(label, style: styleLabel),
        ),
        Expanded(
          child: Text(value, style: styleVal),
        ),
      ],
    );
  }
}
