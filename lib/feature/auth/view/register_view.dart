import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import '../../../core/components/button/app_bar_back_button.dart';
import '../../../core/components/row/my_row.dart';
import '../../../core/components/row/textfield_with_button.dart';
import '../../../core/components/text/custom_subtitle_text.dart';
import '../../../core/components/text/default_title.dart';
import '../../../core/constants/image/image_enums.dart';
import '../../../core/manager/navigation_manager.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../../product/widgets/app_bar/default_app_bar.dart';
import '../../../product/widgets/text_field/email_textfield.dart';
import '../../../product/widgets/text_field/name_textfield.dart';
import '../../../product/widgets/text_field/password_textfield.dart';
import '../view_model/auth_provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView>
    with BaseState, NavigatorManager {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: DefaultAppBar(
            leading: AppBarBackButton(
          context: context,
        )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            context.isKeyBoardOpen
                ? const SizedBox()
                : const Expanded(flex: 8, child: _imageSection()),
            context.emptySizedHeightBoxLow3x,
            Expanded(
              flex: 12,
              child: _buildBodySection(context),
            ),
          ],
        ));
  }

  MyRow _buildBodySection(BuildContext context) {
    return MyRow(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultTitleText(text: LocaleKeys.register_registerTitle.tr()),
          context.emptySizedHeightBoxLow,
          DefaultSubtitle(text: LocaleKeys.register_registerDescription.tr()),
          context.emptySizedHeightBoxLow3x,
          NameTextField(controller: _nameController),
          context.emptySizedHeightBoxLow,
          EmailTextField(controller: _emailController),
          context.emptySizedHeightBoxLow,
          _passwordAndButton(context),
          const Spacer(),
        ],
      ),
    );
  }

  CustomTextFieldWithButton _passwordAndButton(BuildContext context) {
    return CustomTextFieldWithButton(
        textField: PasswordTextField(controller: _passwordController),
        onPressed: () => context.read<AuthViewModel>().signUpWithEmail(
            email: _emailController.text,
            password: _passwordController.text,
            name: _nameController.text,
            context: context));
  }
}

class _imageSection extends StatelessWidget {
  const _imageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(ImageItems.RegisterImage.imagePathPng));
  }
}
