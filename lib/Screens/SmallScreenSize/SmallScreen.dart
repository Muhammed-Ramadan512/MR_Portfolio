import 'package:flutter/material.dart';
import '../../Screens/FullScreenSize/FullApparSection/AppBarContent.dart';
import '../../Widgets/HireMeSection.dart';
import 'Sections/AboutSection/SmallAbout.dart';
import 'Sections/ContactSection/SmallContact.dart';
import 'Sections/PortifiloSection/SmallPortofolio.dart';
import 'Sections/ServicesSection/SmallService.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
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
