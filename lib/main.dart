import 'package:flutter/material.dart';
import 'package:mr_portofilo/Provider/Projects.dart';
import 'package:mr_portofilo/Screens/SplashScreen.dart';
import './Screens/HomeScreen/HomScreen.dart';
import 'package:provider/provider.dart';

import './Provider/AllProvider.dart';
import 'package:responsive_builder/responsive_builder.dart';
//import './Screens/SplashScreen.dart';

void main() {
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    ScreenBreakpoints(desktop: 830, tablet: 830, watch: 200),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AllProvider()),
        ChangeNotifierProvider.value(value: AllProjects())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mr Protofilo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(), //MyHomePage(),
      ),
    );
  }
}
