// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/base/base_state.dart';
import '../../../core/components/list_tile/custom_category_list_tile.dart';
import '../../../core/constants/image/image_enums.dart';
import '../../lang/locale_keys.g.dart';

class IncomeListTile extends StatelessWidget with BaseState {
  IncomeListTile(
      {super.key,
      this.title,
      this.trailing,
      this.subtitle,
      this.imagePath,
      this.onTap});
  final String? title;
  final Widget? trailing;
  final String? subtitle;
  final String? imagePath;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return CustomCategoryListTile(
      onTap: onTap,
      title: title,
      color: colorConstants.caribbienGreen,
      imagePath: imagePath ?? ImageItems.IncomeLogo.imagePathPng,
      subtitle: subtitle ?? LocaleKeys.addTransaction_income.tr(),
      trailing: trailing,
    );
  }
}
