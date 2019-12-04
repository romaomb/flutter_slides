import 'package:flutter_slides/src/slides_manager.dart';
import 'package:flutter/material.dart';

class SliderProvider extends InheritedWidget {
  const SliderProvider({
    @required this.manager,
    @required Widget child,
  })  : assert(manager != null),
        assert(child != null),
        super(child: child);

  final SliderManager manager;

  static SliderProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SliderProvider>();
  }

  @override
  bool updateShouldNotify(SliderProvider old) => false;
}
