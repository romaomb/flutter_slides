import 'package:flutter_slides/src/slides_foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const downKeyCode = 121;
const upKeyCode = 116;
const leftKeyCode = 123;
const rightKeyCode = 124;

class SliderListener extends StatefulWidget {
  const SliderListener({
    @required this.child,
    @required this.behavior,
    @required this.onKeyPressed,
  })  : assert(child != null),
        assert(behavior != null),
        assert(onKeyPressed != null);

  final Widget child;
  final Function onKeyPressed;
  final SlideSwipeBehavior behavior;

  @override
  _SliderListenerState createState() => _SliderListenerState();
}

class _SliderListenerState extends State<SliderListener> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: onKeyEvent,
      child: widget.child,
    );
  }

  void onKeyEvent(RawKeyEvent event) {
    if (event.runtimeType == RawKeyUpEvent &&
        event.data.runtimeType == RawKeyEventDataMacOs) {
      final RawKeyEventDataMacOs data = event.data;

      final previousKeyCode =
          widget.behavior == SlideSwipeBehavior.useLeftAndRightKeys
              ? leftKeyCode
              : downKeyCode;

      final nextKeyCode =
      widget.behavior == SlideSwipeBehavior.useLeftAndRightKeys
          ? rightKeyCode
          : upKeyCode;

      if (data.keyCode == previousKeyCode) {
        widget.onKeyPressed(SlideAction.previous);
      } else if (data.keyCode == nextKeyCode) {
        widget.onKeyPressed(SlideAction.next);
      }
    }
  }
}
