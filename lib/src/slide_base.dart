import 'package:flutter_slides/src/slide_presenter.dart';
import 'package:flutter/material.dart';

abstract class SlideBase extends StatelessWidget {
  SlideBase({
    this.titleFlex = 2,
    this.bodyFlex = 6,
  });

  final int titleFlex;
  final int bodyFlex;

  Widget title(BuildContext context);
  Widget background();
  Widget body(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return SlidePresenter(
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
