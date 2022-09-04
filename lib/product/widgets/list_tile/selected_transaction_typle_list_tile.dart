import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../feature/add_transaction/view_model/add_transaction_provider.dart';
import '../../model/transaction.dart';
import 'expense_list_tile.dart';
import 'income_list_tile.dart';
import 'saving_list_tile.dart';

class SelectedTransactionTypeListTile extends StatelessWidget {
  const SelectedTransactionTypeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return findCategory(context, context.read<AddTransactionProvider>());
  }
}

Widget findCategory(BuildContext context, provider) {
  switch (provider.selectedCategory) {
    case TransactionType.Income:
      return IncomeListTile();
    case TransactionType.Expense:
      return ExpenseListTile();
    case TransactionType.Saving:
      return SavingListTile();
    default:
      return const CircularProgressIndicator();
  }
}
