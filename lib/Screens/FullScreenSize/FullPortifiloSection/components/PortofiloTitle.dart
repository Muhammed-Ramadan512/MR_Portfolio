import 'package:flutter/material.dart';

import '../../../../constants.dart';

class PortofiloTitle extends StatelessWidget {
  const PortofiloTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        style: Theme.of(context)
            .textTheme
            .headline2
            .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        children: [
          TextSpan(text: "Recent ", style: TextStyle(color: Colors.amber)),
          TextSpan(text: "Works", style: TextStyle(color: kprimaryColor))
        ]));
  }
}
