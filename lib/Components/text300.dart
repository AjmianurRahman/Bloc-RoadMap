import 'package:flutter/material.dart';

class Text300 extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;

  const Text300(
      {super.key, required this.text, required this.fontSize, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w300, fontSize: fontSize, color: color),
    );
  }
}
