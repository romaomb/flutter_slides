import 'package:flutter/material.dart';

enum SlideAction {
  next,
  previous,
}

enum SlideSwipeBehavior {
  useLeftAndRightKeys,
  useTopAndDownKeys,
}

class Slide {
  const Slide({@required this.route}) : assert(route != null);
  final Widget route;
}
