import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DefaultSubtitle extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;

  const DefaultSubtitle(
      {Key? key, required this.text, this.color, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.tr(),
        style: context.textTheme.subtitle2!
            .copyWith(color: color, fontWeight: fontWeight));
  }
}
