import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../button/custom_done_icon_button.dart';

class CustomTextFieldWithButton extends StatelessWidget {
  const CustomTextFieldWithButton(
      {super.key, required this.textField, required this.onPressed});
  final Widget textField;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(child: textField),
        context.emptySizedWidthBoxHigh,
        DoneIconButton(
          onPressed: onPressed,
        )
      ],
    );
  }
}
