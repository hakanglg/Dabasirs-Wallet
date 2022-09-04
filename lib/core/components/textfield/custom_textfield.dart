import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../base/base_state.dart';

class CustomTextField extends StatelessWidget with BaseState {
  final TextInputType keyboardType;
  final InputDecoration inputDecoration;
  final String? autofillHints;
  final TextInputAction textInputActions;
  final bool? isInvisible;
  final TextStyle? textStyle;
  final bool? autoFocus;
  final TextEditingController? controller;
  final VoidCallback? onPress;

  CustomTextField({
    Key? key,
    required this.keyboardType,
    required this.inputDecoration,
    required this.autofillHints,
    required this.textInputActions,
    this.isInvisible,
    this.textStyle,
    this.autoFocus,
    this.controller,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autoFocus ?? false,
      style: textStyle ?? context.textTheme.bodyText2,
      decoration: inputDecoration,
      keyboardType: keyboardType,
      autofillHints: [autofillHints ?? ""],
      textInputAction: textInputActions,
      obscureText: isInvisible ?? false,
      onEditingComplete: onPress,
    );
  }
}
