import 'package:flutter/material.dart';

import '../../base/base_state.dart';

class CustomSquare extends StatelessWidget with BaseState {
  final double? height;
  final double? width;
  final ShapeBorder? border;
  final Color color;
  final Widget child;

  CustomSquare({
    Key? key,
    required this.color,
    required this.height,
    required this.width,
    required this.border,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height,
      width: width ?? MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
          shape: border ?? borderConstants.radiusRoundedAllLow, color: color),
      child: child,
    );
  }
}
