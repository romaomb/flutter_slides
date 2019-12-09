import 'package:flutter_slides/flutter_slides.dart';
import 'package:flutter/material.dart';

class FirstSlide extends SlideBase {
  @override
  Widget title(BuildContext context) => SlideTitle('Flutter Slides');

  @override
  Widget background() =>
      Container(color: Colors.blue.shade100.withOpacity(0.5));

  @override
  Widget body(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Topic(
            'Flutter is Google’s UI toolkit for building beautiful, natively '
            'compiled applications for mobile, web, and desktop from a single '
            'codebase.',
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 40.0),
                child: FlutterLogo(size: 300),
              ),
            ),
            TopicBox(
              padding: const EdgeInsets.only(top: 80.0, right: 40.0, bottom: 50.0),
              topics: [
                Topic(
                  'Fast Development',
                  subtopics: [
                    Subtopic(
                      text: 'Paint your app to life in milliseconds with '
                          'Stateful Hot Reload.',
                    ),
                    Subtopic(
                      text: 'Use a rich set of fully-customizable widgets '
                          'to build native interfaces in minutes.',
                    ),
                  ],
                ),
                TopicSpace(),
                Topic(
                  'Expressive and Flexible UI',
                  subtopics: [
                    Subtopic(
                      text: 'Quickly ship features with a focus on native '
                          'end-user experiences.',
                    ),
                    Subtopic(
                      text: 'Layered architecture allows for full '
                          'customization, which results in incredibly fast '
                          'rendering and expressive and flexible designs.',
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
