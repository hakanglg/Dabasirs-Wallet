import '../../../core/manager/navigation_manager.dart';
import '../../../product/cache/cache_manager.dart';
import '../../../product/init/product_init.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/image/image_enums.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../model/onboard_model.dart';

class OnboardProvider extends ChangeNotifier with NavigatorManager {
  final CacheManager _cacheManager = CacheManager.instance;
  List<OnboardModel> onBoardItems = [];
  int currentIndex = 0;

  void init() {
    onBoardItems.add(page1);
    onBoardItems.add(page2);
    onBoardItems.add(page3);
    onBoardItems.add(page4);
  }

  void nextPage(int value) {
    currentIndex = value;
    notifyListeners();
  }

  Future<void> completeToOnboard(BuildContext context) async {
    await _cacheManager.saveBool(SharedKeys.IS_FIRST_APP, false);
    navigateAndRemoveToWidget(context, AuthGate());
  }

  OnboardModel page1 = OnboardModel(
      LocaleKeys.onBoard_onboardOneText, ImageItems.OnboardOne.imagePathPng);
  OnboardModel page2 = OnboardModel(
      LocaleKeys.onBoard_onboardTwoText, ImageItems.OnboardTwo.imagePathPng);
  OnboardModel page3 = OnboardModel(LocaleKeys.onBoard_onboardThreeText,
      ImageItems.OnboardThree.imagePathPng);
  OnboardModel page4 = OnboardModel(
      LocaleKeys.onBoard_onboardFourText, ImageItems.OnboardFour.imagePathPng);
}
