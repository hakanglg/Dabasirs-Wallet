// ignore_for_file: use_build_context_synchronously

import 'package:currency_picker/currency_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/base_state.dart';
import '../../../../product/lang/locale_keys.g.dart';
import '../../../core/components/dialog/custom_simple_dialog_option.dart';
import '../../../core/manager/navigation_manager.dart';
import '../../../product/cache/cache_manager.dart';
import '../../auth/service/firebase_auth_service.dart';

class ProfileProvider extends ChangeNotifier with NavigatorManager, BaseState {
  final FirebaseAuthService _auth = FirebaseAuthService(FirebaseAuth.instance);
  final CacheManager _manager = CacheManager.instance;

  get currentUser => _auth.user;

  Future<void> changeLanguage(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding: context.paddingNormal,
            elevation: 10,
            // title: DefaultBodyText(
            //   text: LocaleKeys.profile_selectLanguage.tr(),
            //   color: colorConstants.metroidRed,
            // ),
            children: <Widget>[
              CustomSimpleDialogOption(
                  onPressed: () async {
                    await context.setLocale(const Locale('tr', 'TUR'));
                    await _manager.saveString(
                        SharedKeys.language, LocaleKeys.profile_turkish.tr());
                    notifyListeners();
                    navigateToBack(context);
                  },
                  text: LocaleKeys.profile_turkish),
              const Divider(thickness: 2),
              CustomSimpleDialogOption(
                  onPressed: () async {
                    await context.setLocale(const Locale('en', 'US'));
                    await _manager.saveString(
                        SharedKeys.language, LocaleKeys.profile_english.tr());
                    notifyListeners();
                    navigateToBack(context);
                  },
                  text: LocaleKeys.profile_english)
            ],
          );
        });
    notifyListeners();
  }

  void changeCurrency(BuildContext context) {
    showCurrencyPicker(
      context: context,
      showFlag: true,
      favorite: ["TRY", "USD" "EUR"],
      // currencyFilter: <String>[
      //   "TRY",
      //   'EUR',
      //   'GBP',
      //   'USD',
      //   'AUD',
      //   'CAD',
      //   'JPY',
      //   'HKD',
      //   'CHF',
      //   'SEK',
      //   'ILS'
      // ],
      theme: CurrencyPickerThemeData(
          subtitleTextStyle: context.textTheme.subtitle2,
          backgroundColor: colorConstants.blueExult,
          titleTextStyle: context.textTheme.bodyText1),
      showCurrencyName: true,
      showCurrencyCode: false,
      showSearchField: false,
      onSelect: (Currency currency) {
        _manager.saveString(SharedKeys.currency, currency.symbol.toString());
        notifyListeners();
      },
    );
  }
}
