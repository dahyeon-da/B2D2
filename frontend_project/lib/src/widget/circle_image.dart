import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String imageName;

  CircleImage({required this.imageName});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        'assets/$imageName',
        width: 90,
        height: 90,
        fit: BoxFit.cover,
      ),
    );
  }
}
