import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../product/lang/locale_keys.g.dart';
import '../../base/base_state.dart';

class CustomCategoryListTile extends StatelessWidget with BaseState {
  CustomCategoryListTile({
    super.key,
    this.height,
    this.color,
    this.trailing,
    required this.imagePath,
    required this.subtitle,
    this.shape,
    this.title,
    this.onTap,
  });
  final double? height;
  final ShapeBorder? shape;
  final Color? color;
  final String imagePath;
  final String? title;
  final Widget? trailing;
  final String? subtitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: true,
      leading: _image(context),
      title: _title(context),
      subtitle: _subtitle(context),
      trailing: trailing,
    );
  }

  Text _subtitle(BuildContext context) {
    return Text(
      subtitle.toTitleCase(),
      style: context.textTheme.bodyText2,
    );
  }

  Text _title(BuildContext context) {
    return Text(
      title ?? LocaleKeys.addTransaction_transactionType.tr().toTitleCase(),
      style: context.textTheme.subtitle2,
    );
  }

  Container _image(BuildContext context) {
    return Container(
        height: height ?? context.dynamicHeight(.08),
        decoration: ShapeDecoration(
            shape: shape ?? borderConstants.radiusRoundedAllNormal,
            color: color),
        child: Image.asset(
          imagePath,
        ));
  }
}
