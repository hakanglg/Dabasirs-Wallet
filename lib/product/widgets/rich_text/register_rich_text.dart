import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/base_state.dart';
import '../../../core/manager/navigation_manager.dart';
import '../../../feature/auth/view/register_view.dart';
import '../../lang/locale_keys.g.dart';

class RegisterRichText extends StatelessWidget
    with BaseState, NavigatorManager {
  RegisterRichText({
    Key? key,
  }) : super(key: key);

  void goRegisterView(BuildContext context) {
    navigateToWidget(context, const RegisterView());
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => goRegisterView(context),
        child: Center(
          child: RichText(
              text: TextSpan(style: context.textTheme.subtitle2, children: [
            TextSpan(text: LocaleKeys.login_newToAppText.tr()),
            TextSpan(
                text: LocaleKeys.login_signUpText.tr(),
                style: context.textTheme.bodyText1!
                    .copyWith(color: colorConstants.shadyNeonBlue)),
          ])),
        ));
  }
}

// 
