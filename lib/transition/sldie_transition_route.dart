import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slides/transition/slide_transition_type.dart';

class SlideTransitionRoute<T> extends MaterialPageRoute<T> {
  SlideTransitionRoute({
    WidgetBuilder builder,
    RouteSettings settings,
    this.type,
  }) : super(builder: builder, settings: settings);

  final SlideTransitionType type;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      window.defaultRouteName == settings.name ? child : _getTransition(animation, child);

  Widget _getTransition(Animation<double> animation, Widget child) {
    switch (type) {
      case SlideTransitionType.size:
        return Align(
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        );
      default:
        return FadeTransition(
          opacity: animation,
          child: child,
        );
    }
  }
}
