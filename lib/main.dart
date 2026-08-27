import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'Provider/AllProvider.dart';
import 'Provider/Projects.dart';
import 'Screens/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 900, tablet: 900, watch: 200),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AllProvider()),
        ChangeNotifierProvider(create: (_) => AllProjects()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MR Portfolio - Mohamed Ramadan',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xff0b0f19),
          primaryColor: const Color(0xff00B0DC),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xff00B0DC),
            secondary: Colors.amber,
            surface: Color(0xff161f30),
          ),
          fontFamily: 'Zona',
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
