import 'package:flutter/material.dart';

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
        fullscreenDialog: true,
        settings: const RouteSettings(),
      ),
    );
  }

  void navigateAndRemoveToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => widget,
        fullscreenDialog: true,
        settings: const RouteSettings(),
      ),
    );
  }

  void navigateToBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
