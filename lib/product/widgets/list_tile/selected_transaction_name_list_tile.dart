import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/enums/category_enum.dart';
import '../../../feature/add_transaction/view_model/add_transaction_provider.dart';
import 'expense_list_tile.dart';
import 'income_list_tile.dart';
import 'saving_list_tile.dart';

class SelectedTransactionNameListTile extends StatelessWidget {
  const SelectedTransactionNameListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AddTransactionProvider>();
    return nameListTile(context, provider);
  }
}

Widget nameListTile(BuildContext context, provider) {
  switch (provider.selectedCategory) {
    case Category.Income:
      return IncomeListTile(
        subtitle: provider.selectedCategory.toString(),
      );
    case Category.Expense:
      return ExpenseListTile(
        subtitle: provider.selectedCategory.toString(),
      );
    case Category.Saving:
      return SavingListTile(
        subtitle: provider.selectedCategory.toString(),
      );
    default:
      return const CircularProgressIndicator();
  }
}
