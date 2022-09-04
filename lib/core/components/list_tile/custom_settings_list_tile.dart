import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomSettingsListTile extends StatelessWidget {
  const CustomSettingsListTile(
      {super.key,
      required this.leadingIcon,
      required this.title,
      this.trailing,
      this.onTap});

  final IconData leadingIcon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        dense: true,
        leading: Icon(leadingIcon, color: context.appTheme.iconTheme.color),
        title: Text(
          title.tr(),
          style: context.textTheme.bodyText1,
        ),
        trailing: trailing);
  }
}
