import 'dart:io';

import 'package:example/slides/third_slide.dart';
import 'package:example/slides/second_slide.dart';
import 'package:flutter_slides/flutter_slides.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:example/slides/first_slide.dart';

void main() {
  _enablePlatformOverrideForDesktop();

  final slides = _getSlides();
  final sliderManager = SlideManager(slides);

  runApp(MyApp(slides, sliderManager));
}

void _enablePlatformOverrideForDesktop() {
  if (Platform.isWindows || Platform.isLinux) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

List<Slide> _getSlides() {
  return [
    Slide(route: FirstSlide()),
    Slide(route: SecondSlide()),
    Slide(route: ThirdSlide()),
  ];
}

class MyApp extends StatelessWidget {
  final List<Slide> slides;
  final SlideManager sliderManager;

  const MyApp(this.slides, this.sliderManager);

  @override
  Widget build(BuildContext context) {
    return SlideProvider(
      manager: sliderManager,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        home: slides[0].route,
      ),
    );
  }
}
