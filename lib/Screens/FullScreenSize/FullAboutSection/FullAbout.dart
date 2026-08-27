import 'package:flutter/material.dart';
import 'Info.dart';
import 'image.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      constraints: BoxConstraints(minHeight: height),
      width: double.infinity,
      color: const Color(0xff0b0f19),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              AboutImage(),
              SizedBox(width: 50),
              AboutInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
