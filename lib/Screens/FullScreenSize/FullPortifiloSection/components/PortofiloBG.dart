import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.12,
        child: Image.asset(
          'assets/images/bg_img_2.png',
          fit: BoxFit.cover,
          repeat: ImageRepeat.repeat,
        ),
      ),
    );
  }
}
