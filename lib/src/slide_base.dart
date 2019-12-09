import 'package:flutter_slides/src/slide_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slides/transition/slide_transition_type.dart';

abstract class SlideBase extends StatelessWidget {
  SlideBase({
    this.titleFlex = 2,
    this.bodyFlex = 6,
    this.transitionType = SlideTransitionType.fade,
  });

  final int titleFlex;
  final int bodyFlex;
  final SlideTransitionType transitionType;

  Widget title(BuildContext context);
  Widget background();
  Widget body(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return SlidePresenter(
      transitionType: transitionType,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            background(),
            Column(
              children: [
                Expanded(
                  flex: titleFlex,
                  child: title(context),
                ),
                if (bodyFlex != 0)
                  Expanded(
                    flex: bodyFlex,
                    child: body(context),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
