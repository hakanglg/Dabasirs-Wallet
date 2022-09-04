import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/components/textfield/custom_textfield.dart';
import '../../lang/locale_keys.g.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;

  final String _hintText = "name@domain.com";
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        autoFocus: false,
        controller: controller,
        inputDecoration: InputDecoration(
            hintText: _hintText, label: Text(LocaleKeys.auth_mailText.tr())),
        keyboardType: TextInputType.emailAddress,
        autofillHints: AutofillHints.email,
        textInputActions: TextInputAction.next);
  }
}
