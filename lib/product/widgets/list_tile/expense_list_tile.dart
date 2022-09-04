// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/base/base_state.dart';
import '../../../core/components/list_tile/custom_category_list_tile.dart';
import '../../../core/constants/image/image_enums.dart';
import '../../lang/locale_keys.g.dart';

class ExpenseListTile extends StatelessWidget with BaseState {
  ExpenseListTile(
      {super.key, this.title, this.trailing, this.subtitle, this.onTap});

  final String? title;
  final Widget? trailing;
  final String? subtitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return CustomCategoryListTile(
      onTap: onTap,
      trailing: trailing,
      title: title,
      color: colorConstants.metroidRed,
      imagePath: ImageItems.ExpenseLogo.imagePathPng,
      subtitle: subtitle ?? LocaleKeys.addTransaction_expense.tr(),
    );
  }
}
