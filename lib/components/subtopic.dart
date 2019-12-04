import 'package:flutter/material.dart';

class Subtopic extends StatelessWidget {
  const Subtopic({
    this.text,
    this.child,
    this.startPadding = 40.0,
    this.style = const TextStyle(fontSize: 24),
  }) : assert(text != null || child != null);

  final String text;
  final double startPadding;
  final TextStyle style;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: startPadding),
      child: text != null ? Text(text, style: style) : child,
    );
  }
}
