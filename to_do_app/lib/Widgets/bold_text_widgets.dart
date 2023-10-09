import 'package:flutter/material.dart';

class BoldTextWidget extends StatelessWidget {
  const BoldTextWidget({
    super.key,
    required this.textIn,
    required this.textSize,
  });
  final String textIn;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          textIn,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
