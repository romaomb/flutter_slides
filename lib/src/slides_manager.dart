import 'package:flutter_slides/src/slides_foundation.dart';

class SliderManager {
  final List<Slide> slides;
  int _currentSlideIndex = 0;

  SliderManager(this.slides) : assert(slides != null);

  Slide handlerSliderAction(SlideAction action) {
    int previousSlide = _currentSlideIndex;

    if (action == SlideAction.next && _currentSlideIndex < slides.length - 1) {
      _currentSlideIndex++;
    } else if (action == SlideAction.previous && _currentSlideIndex > 0) {
      _currentSlideIndex--;
    }

    return _currentSlideIndex != previousSlide
        ? slides[_currentSlideIndex]
        : null;
  }
}
