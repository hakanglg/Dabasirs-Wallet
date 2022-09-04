import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import '../../../core/components/row/my_row.dart';
import '../../../core/components/row/textfield_with_button.dart';
import '../../../core/manager/navigation_manager.dart';
import '../../../product/widgets/app_bar/transaction_app_bar.dart';
import '../../../product/widgets/list_tile/selected_transaction_typle_list_tile.dart';
import '../../../product/widgets/stepper/progress_stepper.dart';
import '../../../product/widgets/text_field/transaction_name_textfield.dart';
import '../view_model/add_transaction_provider.dart';

class TransactionNameView extends StatefulWidget {
  const TransactionNameView({super.key});

  @override
  State<TransactionNameView> createState() => _TransactionNameViewState();
}

class _TransactionNameViewState extends State<TransactionNameView>
    with BaseState, NavigatorManager {
  late TextEditingController _controller;
  final int _currentStep = 2;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: TransactionAppBar(),
        body: MyRow(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProgressStepper(
              currentStep: _currentStep,
            ),
            context.emptySizedHeightBoxNormal,
            const Expanded(child: SelectedTransactionTypeListTile()),
            const Spacer(),
            Expanded(child: _TexfieldAndButton(context)),
            const Spacer(
              flex: 3,
            ),
          ],
        )));
  }

  CustomTextFieldWithButton _TexfieldAndButton(BuildContext context) {
    return CustomTextFieldWithButton(
        textField: TransactionNameTextField(
          controller: _controller,
        ),
        onPressed: () {
          context
              .read<AddTransactionProvider>()
              .setTransactionName(_controller.text, context);
        });
  }
}
