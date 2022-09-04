import '../view_model/add_transaction_provider.dart';
import '../../../product/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import '../../../core/components/row/my_row.dart';
import '../../../core/components/text/custom_subtitle_text.dart';
import '../../../core/manager/navigation_manager.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../../product/widgets/app_bar/transaction_app_bar.dart';
import '../../../product/widgets/list_tile/selected_transaction_typle_list_tile.dart';
import '../../../product/widgets/list_tile/transaction_name_list_tile.dart';
import '../../../product/widgets/stepper/progress_stepper.dart';
import '../../../product/widgets/text_field/amount_text_field.dart';

class TransactionAmountView extends StatefulWidget {
  const TransactionAmountView({Key? key}) : super(key: key);
  @override
  State<TransactionAmountView> createState() => _TransactionAmountViewState();
}

class _TransactionAmountViewState extends State<TransactionAmountView>
    with NavigatorManager, BaseState {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final _currentStep = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: TransactionAppBar(),
        body: MyRow(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProgressStepper(currentStep: _currentStep),
            context.emptySizedHeightBoxNormal,
            Expanded(
              child: Column(
                children: const [
                  SelectedTransactionTypeListTile(),
                  TransactionListTile(),
                ],
              ),
            ),
            context.emptySizedHeightBoxNormal,
            Expanded(
              child: Column(
                children: [
                  DefaultSubtitle(text: selectAmount(context)),
                  AmountTextField(
                    controller: _controller,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        )));
  }

  String selectAmount(BuildContext context) {
    switch (context.read<AddTransactionProvider>().selectedCategory) {
      case TransactionType.Expense:
        return LocaleKeys.addTransaction_expenseAmount;
      case TransactionType.Income:
        return LocaleKeys.addTransaction_incomeAmount;
      case TransactionType.Saving:
        return LocaleKeys.addTransaction_savingAmount;
    }
  }
}
