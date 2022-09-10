import 'package:currency_picker/currency_picker.dart';
import '../../../core/components/column/my_column.dart';
import '../../../core/util/snackar/show_alert_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_state.dart';
import '../../../core/components/container/custom_glassify_container.dart';
import '../../../core/components/list_tile/custom_settings_list_tile.dart';
import '../../../core/components/row/my_row.dart';
import '../../../core/components/text/default_title.dart';
import '../../../core/manager/navigation_manager.dart';
import '../../../product/cache/cache_manager.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../../product/widgets/alert_diaog/delete_account_alert.dart';
import '../../../product/widgets/app_bar/default_app_bar.dart';
import '../../../product/widgets/button/logout_icon_button.dart';
import '../../auth/service/firebase_auth_service.dart';
import '../viewmodel/profile_provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with BaseState, NavigatorManager {
  final String _notExistPhoto =
      "https://rapidapi.com/cdn/images?url=https://rapidapi-prod-apis.s3.amazonaws.com/b42aa17d-8ae0-4a28-b29f-587af5454390.png";

  final CacheManager _manager = CacheManager.instance;

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthService>().user;

    return Scaffold(
      appBar: DefaultAppBar(
        trailing: [LogoutIconButton()],
      ),
      body: MyColumn(
        child: MyRow(
          child: Center(
            child: Column(
              children: [
                Expanded(flex: 5, child: _profileNameAndPicture(user)),
                Expanded(flex: 5, child: _settingsContainer(context)),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _profileNameAndPicture(User user) {
    return Column(
      children: [
        Expanded(flex: 10, child: _profileImage(user)),
        const Spacer(),
        Expanded(
            flex: 4, child: DefaultTitleText(text: user.displayName ?? "")),
      ],
    );
  }

  Material _profileImage(User user) {
    return Material(
      elevation: 10.0,
      color: Colors.transparent,
      child: ClipRRect(
          borderRadius: borderConstants.radiusAllMax,
          child: Image.network(
            user.photoURL ?? _notExistPhoto,
            fit: BoxFit.contain,
          )),
    );
  }

  CustomGlassifyContainer _settingsContainer(BuildContext context) {
    return CustomGlassifyContainer(
      widget: MyColumn(
        child: Center(
          child: Column(
            children: [
              Expanded(child: _languageListTile(context)),
              Expanded(child: _themeListTile(context)),
              Expanded(child: _changeCurenyListTile(context)),
              Expanded(child: _deleteAccountListTile(context))
            ],
          ),
        ),
      ),
    );
  }

  CustomSettingsListTile _languageListTile(BuildContext context) {
    return CustomSettingsListTile(
        onTap: () async =>
            await context.read<ProfileProvider>().changeLanguage(context),
        leadingIcon: Icons.language_outlined,
        title: LocaleKeys.profile_language,
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 20,
          children: [
            Text(
              _manager.readString(SharedKeys.language) ?? "",
              style: context.textTheme.subtitle2,
            ),
            Icon(
              CupertinoIcons.right_chevron,
              color: context.appTheme.iconTheme.color,
            )
          ],
        ));
  }

  // ?? LIGHT THEME DOESN'T EXIST  //
  // ?? WHEN THERE IS LIGHT THEME REMOVE THE VALUE AND ONCHANGED COMMENTS AND FEATURE WILL BE WORKING ?? //
  CustomSettingsListTile _themeListTile(BuildContext context) {
    return CustomSettingsListTile(
        leadingIcon: Icons.dark_mode,
        title: LocaleKeys.profile_darkMode,
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 20,
          children: [
            Text(
              "soon",
              style: context.textTheme.subtitle2,
            ),
            Switch.adaptive(
              value: true,
              onChanged: (value) {},
              // value: _manager.readBool(SharedKeys.theme) ?? true,
              // onChanged: (bool value) {
              //   context.read<ThemeNotifier>().changeTheme();
              // },
            )
          ],
        ));
  }

  CustomSettingsListTile _changeCurenyListTile(BuildContext context) {
    return CustomSettingsListTile(
        onTap: () => showCurrencyPicker(
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
                setState(() {
                  _manager.saveString(
                      SharedKeys.currency, currency.symbol.toString());
                });
              },
            ),
        leadingIcon: Icons.attach_money_outlined,
        title: LocaleKeys.profile_changeCurrency,
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 20,
          children: [
            Text(
              _manager.readString(SharedKeys.currency) ?? "",
              style: context.textTheme.subtitle2,
            ),
            Icon(
              CupertinoIcons.right_chevron,
              color: context.appTheme.iconTheme.color,
            )
          ],
        ));
  }

  CustomSettingsListTile _deleteAccountListTile(BuildContext context) {
    return CustomSettingsListTile(
        leadingIcon: CupertinoIcons.delete,
        trailing: Icon(CupertinoIcons.right_chevron,
            color: context.appTheme.iconTheme.color),
        title: LocaleKeys.profile_remove.tr(),
        onTap: () => showAlertDialogCustom(context, DeleteAccountAlert()));
  }
}
