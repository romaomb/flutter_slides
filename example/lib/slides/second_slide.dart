import 'package:example/showcase/flutter_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slides/flutter_slides.dart';

class SecondSlide extends SlideBase {
  @override
  Widget title(BuildContext context) => SlideTitle('Flutter Slides');

  @override
  Widget background(_, __) =>
      Container(color: Colors.green.shade200.withOpacity(0.5));

  @override
  Widget body(BuildContext context) {
    return Row(
      children: [
        TopicBox(
          topics: [
            Topic(
              'You can showcase your app and interact with it, without moving '
              'away from your your presentation',
            ),
            TopicSpace(space: 80),
            Topic(
              'You could also use this space here to show some code... Maybe '
              'something important you are demoing using the app',
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 50.0, bottom: 50.0),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 350,
                child: ClipRect(child: FlutterCounterApp()),
              ),
            ),
          ),
        )
      ],
    );
  }
}
