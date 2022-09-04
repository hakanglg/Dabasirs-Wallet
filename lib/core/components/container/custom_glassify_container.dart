import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

import '../../base/base_state.dart';

// ignore: must_be_immutable
class CustomGlassifyContainer extends StatelessWidget with BaseState {
  CustomGlassifyContainer({super.key, this.height, this.width, this.widget});
  final double? height;
  final double? width;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: height ?? MediaQuery.of(context).size.height,
      width: width ?? MediaQuery.of(context).size.width,
      blur: 4,
      color: colorConstants.white.withOpacity(0.51),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          colorConstants.white.withOpacity(.4),
          colorConstants.white.withOpacity(0.1),
        ],
      ),
      border: Border.fromBorderSide(
        BorderSide(color: colorConstants.white, width: 2),
      ),
      shadowStrength: 8,
      shape: BoxShape.rectangle,
      borderRadius: borderConstants.radiusAllNormal,
      shadowColor: Colors.white.withOpacity(0.24),
      child: widget,
    );
  }
}
