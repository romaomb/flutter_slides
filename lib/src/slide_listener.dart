import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slides/src/slide_foundation.dart';
import 'package:flutter_slides/src/slide_keys.dart';

class SlideListener extends StatefulWidget {
  const SlideListener({
    @required this.child,
    @required this.onKeyPressed,
  })  : assert(child != null),
        assert(onKeyPressed != null);

  final Widget child;
  final Function onKeyPressed;

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
    if (event.runtimeType == RawKeyUpEvent) {
      final pressedKeyCode = _getPressedKeyCode(event.data);

      final previousKeyRange = kIsWeb
          ? SlideKeys.webPreviousKey
          : Platform.isMacOS
              ? SlideKeys.macPreviousKey
              : SlideKeys.windowsPreviousKey;

      final nextKeyRange = kIsWeb
          ? SlideKeys.webNextKey
          : Platform.isMacOS ? SlideKeys.macNextKey : SlideKeys.windowsNextKey;

      if (previousKeyRange.contains(pressedKeyCode)) {
        widget.onKeyPressed(SlideAction.previous);
      } else if (nextKeyRange.contains(pressedKeyCode)) {
        widget.onKeyPressed(SlideAction.next);
      }
    }
  }

  dynamic _getPressedKeyCode(RawKeyEventData data) {
    if (kIsWeb) {
      final RawKeyEventDataWeb web = data;
      return web.code;
    }
    switch (data.runtimeType) {
      case RawKeyEventDataMacOs:
        final RawKeyEventDataMacOs macOs = data;
        return macOs.keyCode;
      case RawKeyEventDataAndroid:
        final RawKeyEventDataAndroid windows = data;
        return windows.keyCode;
      default:
        return -1;
    }
  }
}
