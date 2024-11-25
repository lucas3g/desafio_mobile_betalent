import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final String path;
  final double size;

  const AppIcon({
    super.key,
    required this.path,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: size,
      height: size,
    );
  }
}
