import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.textin,
    required this.textSize,
  });
  final String textin;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      textin,
      style: TextStyle(fontSize: textSize),
    );
  }
}
