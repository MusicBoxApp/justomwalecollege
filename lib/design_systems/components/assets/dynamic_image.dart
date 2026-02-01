import 'package:flutter/material.dart';

class DynamicImage extends StatelessWidget {
  final String image;
  const DynamicImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(image);
  }
}
