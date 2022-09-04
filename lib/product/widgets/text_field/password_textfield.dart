import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/textfield/custom_textfield.dart';
import '../../lang/locale_keys.g.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isSecure = true;

  void _changeSecure() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        autoFocus: false,
        controller: widget.controller,
        inputDecoration: InputDecoration(
            suffix: _visibilityIconButton(),
            hintText: LocaleKeys.login_dummyPasswordText.tr(),
            label: Text(LocaleKeys.auth_passwordText.tr())),
        keyboardType: TextInputType.visiblePassword,
        autofillHints: AutofillHints.password,
        isInvisible: _isSecure,
        textInputActions: TextInputAction.done);
  }

  Widget _visibilityIconButton() {
    return InkWell(
        onTap: _changeSecure,
        child: AnimatedCrossFade(
            firstChild: const Icon(Icons.visibility_outlined),
            secondChild: const Icon(Icons.visibility_off_outlined),
            crossFadeState: _isSecure
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: context.durationLow));
  }
}
