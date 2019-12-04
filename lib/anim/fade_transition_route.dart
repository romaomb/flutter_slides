import 'package:flutter/material.dart';

class FadeTransitionRoute<T> extends MaterialPageRoute<T> {
  FadeTransitionRoute({
    WidgetBuilder builder,
    RouteSettings settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      settings.isInitialRoute
          ? child
          : FadeTransition(
              opacity: animation,
              child: child,
            );
}
