import 'package:flutter/material.dart';

enum SlideAction {
  next,
  previous,
}

class Slide {
  const Slide({@required this.route}) : assert(route != null);
  final Widget route;
}
