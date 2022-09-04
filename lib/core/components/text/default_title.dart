import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DefaultTitleText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const DefaultTitleText(
      {Key? key, required this.text, this.color, this.fontWeight, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.tr(),
        textAlign: textAlign,
        style: context.textTheme.headline5!
            .copyWith(fontWeight: fontWeight, color: color));
  }
}
