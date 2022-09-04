import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../base/base_state.dart';

// ignore: must_be_immutable
class DoneIconButton extends StatelessWidget with BaseState {
  DoneIconButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: borderConstants.radiusRoundedAllNormal,
        color: colorConstants.caribbienGreen,
      ),
      child: IconButton(
          onPressed: onPressed, icon: const Icon(CupertinoIcons.chevron_right)),
    );
  }
}
