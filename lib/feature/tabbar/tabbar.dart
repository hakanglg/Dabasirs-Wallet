import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../core/base/base_state.dart';
import '../../core/manager/navigation_manager.dart';
import '../add_transaction/view/select_category_view.dart';
import '../charts/view/charts_view.dart';
import '../charts/view/monthly_view.dart';
import '../history/view/history_view.dart';
import '../profile/view/profile_view.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView>
    with BaseState, NavigatorManager, TickerProviderStateMixin {
  late PersistentTabController _controller;
  final String _selectCategoryKey = "SelectCategoryView";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: colorConstants.blueExult, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            false, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: borderConstants.radiusTopNormal,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,

        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,

          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style13,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      MonthlyView(),
      ChartsView(),
      Container(color: colorConstants.blueExult),
      HistoryView(),
      const ProfileView()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final Color activeColorPrimary = colorConstants.caribbienGreen;
    final Color inactiveColorPrimary = colorConstants.lunarDust;
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.house_fill),
        // title: ("Home"),
        activeColorPrimary: activeColorPrimary,
        inactiveColorPrimary: inactiveColorPrimary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.graph_square),
        // title: ("Charts"),
        activeColorPrimary: activeColorPrimary,
        inactiveColorPrimary: inactiveColorPrimary,
      ),
      PersistentBottomNavBarItem(
        onPressed: (context) {},
        icon: FloatingActionButton.small(
            heroTag: _selectCategoryKey,
            onPressed: () => navigateToWidget(context, SelectCategoryView()),
            child: Icon(
              CupertinoIcons.add,
              color: colorConstants.blueExult,
            )),
        // onSelectedTabPressWhenNoScreensPushed: function,
        // title: ("Add"),
        contentPadding: 0,
        activeColorPrimary: activeColorPrimary,
        inactiveColorPrimary: inactiveColorPrimary,
      ),
      PersistentBottomNavBarItem(
        contentPadding: 5.0,
        icon: const Icon(
          CupertinoIcons.restart,
        ),
        // title: ("Transactions"),
        activeColorPrimary: activeColorPrimary,
        inactiveColorPrimary: inactiveColorPrimary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        // title: ("Profile"),
        activeColorPrimary: activeColorPrimary,
        inactiveColorPrimary: inactiveColorPrimary,
      ),
    ];
  }
}
