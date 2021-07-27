import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .4,
      child: Image.asset(
        'assets/images/bg_img_2.png',
        height: height * 1.3,
        fit: BoxFit.cover,
        width: width,
      ),
    );
  }
}
