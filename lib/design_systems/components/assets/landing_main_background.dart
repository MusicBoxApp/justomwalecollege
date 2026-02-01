import 'package:flutter/material.dart';

class LandingMainBackground extends StatelessWidget {
  const LandingMainBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Image.asset(
      'assets/5.jpg',
      width: double.infinity,
      fit: BoxFit.cover,
      height: height,
    );
  }
}
