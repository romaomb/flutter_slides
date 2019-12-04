import 'package:flutter/material.dart';

class TopicSpace extends StatelessWidget {
  const TopicSpace({this.space = 40.0});

  final double space;

  @override
  Widget build(BuildContext context) => SizedBox(height: space);
}
