import 'package:flutter_slides/flutter_slides.dart';
import 'package:flutter_slides/src/slide_presenter.dart';
import 'package:flutter/material.dart';

abstract class SlideBase extends StatelessWidget {
  SlideBase({
    this.titleFlex = 2,
    this.bodyFlex = 6,
    this.titleAlignment = Alignment.center,
    this.behavior = SlideSwipeBehavior.useLeftAndRightKeys,
  });

  final int titleFlex;
  final int bodyFlex;
  final Alignment titleAlignment;
  final SlideSwipeBehavior behavior;

  String title();
  Widget background();
  Widget body(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return SlidePresenter(
      behavior: behavior,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            background(),
            Column(
              children: [
                Expanded(
                  flex: titleFlex,
                  child: Align(
                    alignment: titleAlignment,
                    child: Text(
                      title(),
                      style: TextStyle(fontSize: 60.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
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
