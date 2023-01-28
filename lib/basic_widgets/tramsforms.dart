import 'package:flutter/material.dart';

class Transforms extends StatelessWidget {
  const Transforms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -43 / 12.0,
      child: const Icon(Icons.accessibility_new),
    );
  }
}
