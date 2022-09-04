import 'package:flutter/material.dart';

import '../../core/init/theme/dark_theme.dart';
import '../cache/cache_manager.dart';

class ThemeNotifier extends ChangeNotifier {
  final CacheManager _manager = CacheManager.instance;
  bool isDarkTheme = true;

  Future<void> changeTheme() async {
    isDarkTheme = !isDarkTheme;
    if (isDarkTheme == false) {
      await _manager.saveBool(SharedKeys.theme, false);
    } else {
      await _manager.saveBool(SharedKeys.theme, true);
    }
    notifyListeners();
  }

  ThemeData get currentTheme => _manager.readBool(SharedKeys.theme) ?? true
      ? darkTheme
      : ThemeData.light();
}
