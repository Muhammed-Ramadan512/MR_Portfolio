import '../../Widgets/HireMeSection.dart';

import '../../Screens/FullScreenSize/FullApparSection/AppBarContent.dart';
import 'package:flutter/material.dart';

import 'Sections/AboutSection/SmallAbout.dart';
import 'Sections/ContactSection/SmallContact.dart';
import 'Sections/PortifiloSection/SmallPortofolio.dart';
import 'Sections/ServicesSection/SmallService.dart';

class SmallScreen extends StatefulWidget {
  @override
  _SmallScreenState createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarContnet(),
        SmallAbout(),
        SmallService(),
        HireMeSection(),
        SmallPortoFolio(),
        SmallContact(),
      ],
    );
  }
}
