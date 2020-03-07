import 'package:flutter_slides/transition/slide_transition_route.dart';
import 'package:flutter_slides/transition/slide_transition_type.dart';
import 'package:flutter_slides/src/slide_foundation.dart';
import 'package:flutter_slides/src/slide_listener.dart';
import 'package:flutter_slides/src/slide_provider.dart';
import 'package:flutter/material.dart';

class SlidePresenter extends StatelessWidget {
  const SlidePresenter({
    @required this.child,
    this.transitionType,
  }) : assert(child != null);

  final Widget child;
  final SlideTransitionType transitionType;

  @override
  Widget build(BuildContext context) {
    return SlideListener(
      child: child,
      onKeyPressed: (SlideAction action) => _onKeyPressed(context, action),
    );
  }

  void _onKeyPressed(BuildContext context, SlideAction action) {
    final manager = SlideProvider.of(context).manager;
    final nextSlide = manager.handlerSliderAction(action);
    if (nextSlide != null) {
      Navigator.push(
        context,
        SlideTransitionRoute(
          builder: (_) => nextSlide.route,
          type: transitionType,
        ),
      );
    }
  }
}
