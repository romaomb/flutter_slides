import 'package:flutter_slides/src/slide_manager.dart';
import 'package:flutter/material.dart';

class SlideProvider extends InheritedWidget {
  const SlideProvider({
    @required this.manager,
    @required Widget child,
  })  : assert(manager != null),
        assert(child != null),
        super(child: child);

  final SlideManager manager;

  static SlideProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SlideProvider>();
  }

  @override
  bool updateShouldNotify(SlideProvider old) => false;
}
