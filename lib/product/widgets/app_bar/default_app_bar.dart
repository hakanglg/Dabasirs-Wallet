import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/manager/navigation_manager.dart';
import '../rich_text/appbar_title.dart';

class DefaultAppBar extends StatelessWidget
    with PreferredSizeWidget, NavigatorManager {
  DefaultAppBar({
    super.key,
    this.leading,
    this.trailing,
  });
  final Widget? leading;
  final List<Widget>? trailing;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: context.appTheme.appBarTheme.iconTheme,
      leading: leading,
      actions: trailing,
      title: AppBarTitle(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
