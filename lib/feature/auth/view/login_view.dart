import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import '../../../core/components/row/my_row.dart';
import '../../../core/components/row/textfield_with_button.dart';
import '../../../core/components/text/custom_subtitle_text.dart';
import '../../../core/components/text/default_title.dart';
import '../../../core/constants/image/image_enums.dart';
import '../../../core/manager/navigation_manager.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../../product/widgets/app_bar/default_app_bar.dart';
import '../../../product/widgets/button/login_google_button.dart';
import '../../../product/widgets/rich_text/register_rich_text.dart';
import '../../../product/widgets/text_field/email_textfield.dart';
import '../../../product/widgets/text_field/password_textfield.dart';
import '../view_model/auth_provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with BaseState, NavigatorManager {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: DefaultAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            context.isKeyBoardOpen
                ? const SizedBox()
                : Expanded(flex: 2, child: _imageSection()),
            context.emptySizedHeightBoxLow3x,
            Expanded(flex: 3, child: _bodySection(context)),
          ],
        ));
  }

  Center _imageSection() {
    return Center(child: Image.asset(ImageItems.LoginImage.imagePathPng));
  }

  MyRow _bodySection(BuildContext context) {
    return MyRow(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DefaultTitleText(text: LocaleKeys.login_loginTitle),
          context.emptySizedHeightBoxLow3x,
          EmailTextField(controller: _emailController),
          context.emptySizedHeightBoxLow,
          _passwordAndLoginButton(context),
          context.emptySizedHeightBoxLow3x,
          const Center(child: DefaultSubtitle(text: LocaleKeys.login_orText)),
          context.emptySizedHeightBoxLow3x,
          LoginWithGoogleButton(),
          const Spacer(),
          RegisterRichText(),
          const Spacer(),
        ],
      ),
    );
  }

  CustomTextFieldWithButton _passwordAndLoginButton(BuildContext context) {
    return CustomTextFieldWithButton(
        textField: PasswordTextField(
          controller: _passwordController,
        ),
        onPressed: () => context.read<AuthViewModel>().loginWithMail(
            _emailController.text, _passwordController.text, context));
  }
}
