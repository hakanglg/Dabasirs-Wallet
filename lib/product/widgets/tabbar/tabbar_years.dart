// ignore_for_file: non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../rich_text/appbar_title.dart';

class AppbarYearTab extends StatelessWidget implements PreferredSizeWidget {
  const AppbarYearTab({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppBarTitle(),
      bottom: PreferredSize(
          preferredSize: preferredSize,
          child: AppbarTab(context, controller, _myTabs(context))),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  Widget AppbarTab(
      BuildContext context, TabController controller, List<Tab> tabs) {
    return TabBar(
        indicator: context.appTheme.tabBarTheme.indicator,
        controller: controller,
        unselectedLabelStyle: context.appTheme.tabBarTheme.unselectedLabelStyle,
        labelStyle: context.appTheme.tabBarTheme.labelStyle,
        isScrollable: true,
        tabs: tabs);
  }

  List<Tab> _myTabs(BuildContext context) {
    return List.generate(controller.length, (index) {
      var date = DateTime(DateTime(2022).year + index);
      String yearDisplay = DateFormat.y().format(date);

      return _TabBarSized(context, yearDisplay);
    });
  }

  Tab _TabBarSized(BuildContext context, String yearDisplay) {
    return Tab(
        child: Padding(
      padding: context.horizontalPaddingLow,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: Text(yearDisplay)),
        ],
      ),
    ));
  }
}
