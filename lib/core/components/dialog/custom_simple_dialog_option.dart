import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../base/base_state.dart';
import '../text/custom_body_text.dart';

class CustomSimpleDialogOption extends StatelessWidget with BaseState {
  CustomSimpleDialogOption(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: DefaultBodyText(
        text: text.tr(),
        color: colorConstants.blueExult,
      ),
    );
  }
}
