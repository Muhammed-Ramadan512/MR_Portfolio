import 'package:flutter/material.dart';

class Project {
  final List<String> images;
  final String tilte;
  final String subTitle;
  final List<String> labels;
  final String link;
  final String? playStoreLink;
  final String? appStoreLink;

  Project({
    required this.link,
    this.playStoreLink,
    this.appStoreLink,
    required this.images,
    required this.labels,
    required this.subTitle,
    required this.tilte,
  });
}

class AllProjects extends ChangeNotifier {
  final List<Project> _allProjects = [
    Project(
      link: "https://play.google.com/store/apps/developer?id=VClasses",
      playStoreLink: "https://play.google.com/store/apps/developer?id=VClasses",
      appStoreLink:
          "https://apps.apple.com/us/developer/mohamed-ahmed-radwan/id1586606710",
      tilte: "VClasses White-Label Platform",
      labels: [
        'Flutter',
        'Clean Architecture',
        'White-Label',
        'CI/CD & Fastlane',
        'DRM & Security',
        'WebSockets',
      ],
      images: ['assets/images/vclasses.jpg'],
      subTitle:
          'Unified multi-tenant white-label EdTech/LMS platform supporting 176+ client configurations and 100+ production iOS & Android apps across Google Play and App Store. Features Shorebird OTA, offline DRM HLS playback, and AI Assistant.',
    ),
    Project(
      link:
          "https://play.google.com/store/apps/details?id=com.commerce.commerceaiotry",
      playStoreLink:
          "https://play.google.com/store/apps/details?id=com.commerce.commerceaiotry",
      tilte: "KIDORA - Kids Toys Store",
      labels: [
        'Flutter',
        'Shopify API',
        'E-Commerce',
        'Cart & Checkout',
        'Payment Gateways',
      ],
      images: ['assets/images/kidora.jpg'],
      subTitle:
          'E-Commerce mobile application for children\'s toys, fully integrated with Shopify Storefront API, seamless catalog browsing, cart management, and secure online payment gateways.',
    ),
    Project(
      link: "https://play.google.com/store/apps/details?id=com.Mr.MyPet",
      playStoreLink:
          "https://play.google.com/store/apps/details?id=com.Mr.MyPet",
      tilte: "MyPet Mobile App",
      labels: [
        'Flutter',
        'Dart',
        'Firebase',
        'Real-time Chat',
      ],
      images: ['assets/images/P1-0.jpg', 'assets/images/P1-1.jpg'],
      subTitle:
          'Full-featured mobile application for pet management, adoptions, volunteer coordination, and seller-to-adopter communication with real-time in-app chat.',
    ),
    Project(
      tilte: "MR Senior Portfolio (Web)",
      labels: [
        'Flutter Web',
        'Dart',
        'Responsive Architecture',
      ],
      images: ['assets/images/P2-0.jpg', 'assets/images/P2-1.jpg'],
      subTitle:
          "Personal Web Portfolio built completely with Flutter Web showcasing 5+ years of mobile engineering, architecture, and production delivery.",
      link: 'https://mr-portofolio.web.app/#/',
    ),
  ];

  List<Project> get allProjects {
    return [..._allProjects];
  }
}
