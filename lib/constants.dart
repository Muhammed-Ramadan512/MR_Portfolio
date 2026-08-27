import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<String> menuItem = [
  'Home',
  'About',
  'Services',
  'Portfolio',
  'Contact'
];

class ServiceItem {
  final String title;
  final IconData icon;
  final List<Color> gradient;

  const ServiceItem({
    required this.title,
    required this.icon,
    required this.gradient,
  });
}

final List<ServiceItem> serviceItems = [
  const ServiceItem(
    title: 'Cross-Platform Mobile (iOS & Android)',
    icon: FontAwesomeIcons.mobileScreenButton,
    gradient: [Color(0xff00B0DC), Color(0xff0284c7)],
  ),
  const ServiceItem(
    title: 'White-Label & Multi-Tenant Architecture',
    icon: FontAwesomeIcons.layerGroup,
    gradient: [Colors.amber, Color(0xffd97706)],
  ),
  const ServiceItem(
    title: 'CI/CD & App Store Release Automation',
    icon: FontAwesomeIcons.rocket,
    gradient: [Color(0xff8b5cf6), Color(0xff6366f1)],
  ),
  const ServiceItem(
    title: 'Real-Time Systems & Mobile Security',
    icon: FontAwesomeIcons.shieldHalved,
    gradient: [Color(0xff10b981), Color(0xff059669)],
  ),
];

final List<String> services = serviceItems.map((e) => e.title).toList();

final List<String> skills_1 = [
  "Flutter & Dart",
  "Clean Architecture",
  "CI/CD & Fastlane",
  "Shorebird OTA",
  "SSL Pinning & freeRASP",
  "White-Label Systems",
];

final List<String> skills_2 = [
  "WebSockets & REST APIs",
  "HLS & VdoCipher DRM",
  "Firebase Suite",
  "Payment Gateways",
  "Hive & Offline Storage",
  "App Store / Google Play",
];

const Color kprimaryColor = Color(0xff00B0DC);
const Color kSecondColor = Colors.amber;
const Color kDarkBackground = Color(0xff0b0f19);
const Color kSurfaceColor = Color(0xff161f30);
