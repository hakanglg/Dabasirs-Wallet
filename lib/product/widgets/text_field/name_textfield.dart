import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/components/textfield/custom_textfield.dart';
import '../../lang/locale_keys.g.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        controller: controller,
        inputDecoration: InputDecoration(
            hintText: LocaleKeys.register_nameText.tr(),
            label: Text(LocaleKeys.register_nameText.tr())),
        keyboardType: TextInputType.name,
        autofillHints: AutofillHints.name,
        textInputActions: TextInputAction.next);
  }
}
