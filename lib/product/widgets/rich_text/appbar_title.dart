import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/base_state.dart';
import '../../lang/locale_keys.g.dart';

class AppBarTitle extends StatelessWidget with BaseState {
  AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: LocaleKeys.global_appBarTitleFirst.tr(),
        style: context.textTheme.bodyText1!
            .copyWith(fontWeight: FontWeight.bold, color: colorConstants.white),
        children: <TextSpan>[
          TextSpan(
              text: LocaleKeys.global_appBarTitleLast.tr(),
              style: const TextStyle(fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }
}
