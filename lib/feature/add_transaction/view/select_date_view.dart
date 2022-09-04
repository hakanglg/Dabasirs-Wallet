// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../core/components/button/custom_done_icon_button.dart';
import '../../../core/components/row/my_row.dart';
import '../../../core/manager/navigation_manager.dart';
import '../../../product/model/transaction.dart';
import '../../../product/service/firebase_firestore_service.dart';
import '../../../product/widgets/app_bar/transaction_app_bar.dart';
import '../../../product/widgets/list_tile/amount_list_tile.dart';
import '../../../product/widgets/list_tile/selected_transaction_typle_list_tile.dart';
import '../../../product/widgets/list_tile/transaction_name_list_tile.dart';
import '../../../product/widgets/stepper/progress_stepper.dart';
import '../../auth/service/firebase_auth_service.dart';
import '../view_model/add_transaction_provider.dart';
import 'final_transaction_ticket_view.dart';

class SelectDateView extends StatefulWidget {
  const SelectDateView({Key? key}) : super(key: key);
  @override
  State<SelectDateView> createState() => _SelectDateViewState();
}

class _SelectDateViewState extends State<SelectDateView> with NavigatorManager {
  final _currentStep = 4;
  late TextEditingController _controller;
  var uuid = const Uuid();

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
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProgressStepper(currentStep: _currentStep),
            context.emptySizedHeightBoxNormal,
            Expanded(
              child: Column(
                children: [
                  const SelectedTransactionTypeListTile(),
                  const TransactionListTile(),
                  AmountListTile(),
                ],
              ),
            ),
            context.emptySizedHeightBoxNormal,
            _selectDatePickerAndGoButton(context),
            const Spacer(),
          ],
        )));
  }

  Row _selectDatePickerAndGoButton(BuildContext context) {
    final AddTransactionProvider provider =
        context.read<AddTransactionProvider>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: _selectDatePicker(context),
        ),
        context.emptySizedWidthBoxHigh,
        DoneIconButton(onPressed: () async {
          await context.read<FireStoreService>().addTransaction(
                TransactionModel(
                    provider.transactionName,
                    provider.selectedCategory,
                    provider.transactionAmount,
                    provider.currentTime,
                    uuid.v1()),
                context.read<FirebaseAuthService>().user,
              );
          navigateToWidget(context, const FinalTransactionTicketView());
        })
      ],
    );
  }

  ListTile _selectDatePicker(BuildContext context) {
    return ListTile(
      onTap: () => context.read<AddTransactionProvider>().selectDate(context),
      leading: Icon(
        CupertinoIcons.calendar,
        color: context.appTheme.iconTheme.color,
      ),
      title: Text(
        context.watch<AddTransactionProvider>().selectDateText,
        style: context.textTheme.bodyText2,
      ),
    );
  }
}
