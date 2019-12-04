import 'package:flutter_slides/src/slide_foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const downKeyCode = 121;
const upKeyCode = 116;
const leftKeyCode = 123;
const rightKeyCode = 124;

class SlideListener extends StatefulWidget {
  const SlideListener({
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
  _SlideListenerState createState() => _SlideListenerState();
}

class _SlideListenerState extends State<SlideListener> {
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
