import 'package:flutter/material.dart';
import '../../Widgets/HireMeSection.dart';
import 'FullAboutSection/FullAbout.dart';
import 'FullApparSection/AppBarContent.dart';
import 'FullContactSection/FullContact.dart';
import 'FullPortifiloSection/FullProtofilo.dart';
import 'FullServicesSection/FullServices.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AppBarContnet(),
        About(),
        FullServices(),
        HireMeSection(),
        FullProtofilo(),
        FullContact(),
      ],
    );
  }
}
