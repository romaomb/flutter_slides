import 'package:flutter/material.dart';
import 'package:flutter_slides/flutter_slides.dart';

class ThirdSlide extends SlideBase {
  @override
  Widget title(BuildContext context) => SlideTitle('Thank you!');

  @override
  Widget background(_, __) => Container(
        child: Image.asset(
          'assets/see_ya.gif',
          fit: BoxFit.fill,
        ),
      );

  @override
  Widget body(BuildContext context) => Container();
}
