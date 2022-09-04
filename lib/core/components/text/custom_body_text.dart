import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DefaultBodyText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;

  const DefaultBodyText(
      {Key? key, required this.text, this.fontWeight, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.tr(),
        style: context.textTheme.bodyText1!
            .copyWith(fontWeight: fontWeight, color: color));
  }
}
