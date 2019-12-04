import 'package:flutter_slides/components/subtopic.dart';
import 'package:flutter_slides/components/topic_space.dart';
import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  const Topic(
    this.text, {
    this.subtopics,
    this.fontSize = 32.0,
    this.textAlign = TextAlign.start,
  });

  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final List<Subtopic> subtopics;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildChildren(),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> children = [Text(text, textAlign: textAlign, style: TextStyle(fontSize: fontSize))];
    if (subtopics != null) {
      for (var subtopic in subtopics) {
        children.add(TopicSpace(space: 8.0));
        children.add(subtopic);
      }
    }
    return children;
  }
}
