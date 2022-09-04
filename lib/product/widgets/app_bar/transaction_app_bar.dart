import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../lang/locale_keys.g.dart';

class TransactionAppBar extends StatelessWidget with PreferredSizeWidget {
  TransactionAppBar({
    Key? key,
    this.isShowTitle = true,
    this.leadingOnPressed,
  }) : super(key: key);

  final VoidCallback? leadingOnPressed;
  bool? isShowTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _leadingIconButton(context, leadingOnPressed),
      title: isShowTitle! ? _appbarTitleText(context) : null,
    );
  }

  Text _appbarTitleText(BuildContext context) {
    return Text(LocaleKeys.addTransaction_addTransactionText.tr(),
        style: context.textTheme.bodyText1);
  }

  IconButton _leadingIconButton(BuildContext context, leadingOnPressed) {
    return IconButton(
      icon: Icon(
        CupertinoIcons.xmark,
        color: context.appTheme.iconTheme.color,
      ),
      onPressed: leadingOnPressed ?? () => Navigator.pop(context),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
