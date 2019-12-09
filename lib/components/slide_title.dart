import 'package:flutter/material.dart';

class SlideTitle extends StatelessWidget {
  const SlideTitle(this.text,
      {this.alignment = Alignment.center, this.fontSize = 60.0});

  final String text;
  final Alignment alignment;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
        textAlign: TextAlign.center,
      ),
    );
  }
}
