import 'package:flutter/material.dart';
import '../../../../constants.dart';

class PortofiloTitle extends StatelessWidget {
  const PortofiloTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        style: TextStyle(
          fontFamily: "Zona",
          fontSize: 34,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
        children: [
          TextSpan(text: "Recent ", style: TextStyle(color: Colors.amber)),
          TextSpan(text: "Works", style: TextStyle(color: kprimaryColor)),
        ],
      ),
    );
  }
}
