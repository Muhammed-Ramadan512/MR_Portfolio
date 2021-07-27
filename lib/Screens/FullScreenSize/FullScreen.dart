import 'package:flutter/material.dart';
import '../../Widgets/HireMeSection.dart';

import './FullAboutSection/FullAbout.dart';
import './FullApparSection/AppBarContent.dart';
import './FullPortifiloSection/FullProtofilo.dart';
import './FullServicesSection/FullServices.dart';
import 'FullContactSection/FullContact.dart';

class FullScreen extends StatefulWidget {
  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
