import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/components/textfield/custom_textfield.dart';
import '../../../core/manager/navigation_manager.dart';
import '../../../feature/add_transaction/view_model/add_transaction_provider.dart';
import '../../lang/locale_keys.g.dart';

class TransactionNameTextField extends StatefulWidget {
  const TransactionNameTextField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  State<TransactionNameTextField> createState() =>
      _TransactionNameTextFieldState();
}

class _TransactionNameTextFieldState extends State<TransactionNameTextField>
    with NavigatorManager {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        controller: widget.controller,
        onPress: () {
          context
              .read<AddTransactionProvider>()
              .setTransactionName(widget.controller!.text, context);
        },
        autoFocus: true,
        inputDecoration: InputDecoration(
            hintText: LocaleKeys.addTransaction_enterTransactionName.tr(),
            labelText: LocaleKeys.addTransaction_transactionName.tr()),
        keyboardType: TextInputType.text,
        autofillHints: null,
        textInputActions: TextInputAction.done);
  }
}
