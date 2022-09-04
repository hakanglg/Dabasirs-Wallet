import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/util/snackar/show_snackbar.dart';
import '../../../feature/add_transaction/view_model/add_transaction_provider.dart';
import '../../lang/locale_keys.g.dart';

class AmountTextField extends StatefulWidget {
  const AmountTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<AmountTextField> createState() => _AmountTextFieldState();
}

class _AmountTextFieldState extends State<AmountTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: context.textTheme.headline1,
      keyboardType: TextInputType.number,
      autofocus: true,
      onEditingComplete: () {
        if (widget.controller.text.isNullOrEmpty) {
          showSnackBarError(
              context, LocaleKeys.addTransaction_emptyTransactionAmount.tr());
        }
        context.read<AddTransactionProvider>().setTransactionAmount(
            double.parse(widget.controller.text), context);
      },
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: "24.00",
          hintStyle: context.textTheme.headline1),
    );
  }
}
