import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import '../../../core/components/text/custom_body_text.dart';
import '../../../core/constants/image/image_enums.dart';
import '../../../feature/auth/view_model/auth_provider.dart';
import '../../lang/locale_keys.g.dart';

class LoginWithGoogleButton extends StatelessWidget with BaseState {
  LoginWithGoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(.06),
      child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              shape: borderConstants.radiusRoundedAllNormal),
          onPressed: () =>
              context.read<AuthViewModel>().signInWithGoogle(context),
          icon: Image.asset(
            ImageItems.GoogleIcon.imagePathPng,
          ),
          label: DefaultBodyText(
            text: LocaleKeys.login_loginGoogleText.tr(),
          )),
    );
  }
}
