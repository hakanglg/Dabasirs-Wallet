import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/manager/navigation_manager.dart';
import '../../../core/util/snackar/show_snackbar.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../../product/model/transaction.dart';
import '../view/select_date_view.dart';
import '../view/transaction_amount_view.dart';

class AddTransactionProvider extends ChangeNotifier with NavigatorManager {
  AddTransactionProvider();

  late TransactionType selectedCategory;
  late String transactionName;
  late double? transactionAmount;

  DateTime currentTime = DateTime.now();
  var selectDateText = LocaleKeys.addTransaction_today.tr();

  void setSelectedCategory(TransactionType category) {
    selectedCategory = category;
    notifyListeners();
  }

  void setTransactionName(String name, BuildContext context) {
    if (name.isNotEmpty) {
      transactionName = name;
      navigateToWidget(context, const TransactionAmountView());
      notifyListeners();
    } else {
      showSnackBarError(
          context, LocaleKeys.addTransaction_emptyTransactionName.tr());
    }

    notifyListeners();
  }

  void setTransactionAmount(double? amount, BuildContext context) {
    if (amount != null && amount > 0 && amount != String) {
      transactionAmount = amount;
      navigateToWidget(context, const SelectDateView());
      notifyListeners();
    } else if (amount!.isNegative) {
      showSnackBarError(context,
          LocaleKeys.addTransaction_negativeTransactionAmountError.tr());
    } else {
      showSnackBarError(
          context, LocaleKeys.addTransaction_emptyTransactionAmount.tr());
    }

    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: currentTime,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2022),
        lastDate: DateTime(2100));
    if (picked == null) {
      return;
    } else {
      currentTime = picked;
      selectDateText =
          "${picked.day.toString()}/${picked.month.toString()}/${picked.year.toString()}";
      notifyListeners();

      return;
    }
  }
}
