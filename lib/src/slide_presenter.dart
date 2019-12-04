import 'package:flutter_slides/src/slide_foundation.dart';
import 'package:flutter_slides/src/slide_listener.dart';
import 'package:flutter_slides/src/slide_provider.dart';
import 'package:flutter_slides/anim/fade_transition_route.dart';
import 'package:flutter/material.dart';

class SlidePresenter extends StatelessWidget {
  const SlidePresenter({
    @required this.child,
    @required this.behavior,
  })  : assert(child != null),
        assert(behavior != null);

  final Widget child;
  final SlideSwipeBehavior behavior;

  @override
  Widget build(BuildContext context) {
    return SlideListener(
      child: child,
      behavior: behavior,
      onKeyPressed: (SlideAction action) => _onKeyPressed(context, action),
    );
  }

  void _onKeyPressed(BuildContext context, SlideAction action) {
    final manager = SlideProvider.of(context).manager;
    final nextSlide = manager.handlerSliderAction(action);
    if (nextSlide != null) {
      Navigator.push(
        context,
        FadeTransitionRoute(builder: (_) => nextSlide.route),
      );
    }
  }
}
