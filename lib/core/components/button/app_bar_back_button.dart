import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../base/base_state.dart';
import '../../manager/navigation_manager.dart';

// ignore: must_be_immutable
class AppBarBackButton extends StatelessWidget
    with NavigatorManager, BaseState {
  AppBarBackButton({super.key, required this.context});
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToBack(context),
      child: Icon(
        CupertinoIcons.back,
        color: colorConstants.white,
      ),
    );
  }
}
