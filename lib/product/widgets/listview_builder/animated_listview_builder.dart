import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/components/dismissible/remove_slide.dart';
import '../../../core/components/list_view/animated_list_view.dart';
import '../../../core/util/snackar/currency_formatter.dart';
import '../../../core/util/snackar/date_time_formatter.dart';
import '../../../feature/history/viewmodel/history_provider.dart';
import '../../cache/cache_manager.dart';
import '../../model/transaction.dart';
import '../list_tile/expense_list_tile.dart';
import '../list_tile/income_list_tile.dart';
import '../list_tile/saving_list_tile.dart';

class AnimatedListViewBuilder extends StatefulWidget {
  const AnimatedListViewBuilder(
      {super.key, required this.model, required this.user});
  final List<TransactionModel> model;
  final User user;

  @override
  State<AnimatedListViewBuilder> createState() =>
      _AnimatedListViewBuilderState();
}

class _AnimatedListViewBuilderState extends State<AnimatedListViewBuilder> {
  final CacheManager _manager = CacheManager.instance;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        cacheExtent: 0,
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        itemCount: widget.model.length,
        itemBuilder: (context, index) => AnimatedScrollViewItem(
            child: RemoveSlide(
                onRemove: (context) => context
                    .read<HistoryProvider>()
                    .removeTransaction(widget.model[index], widget.user),
                child: findCategory(widget.model[index]))));
  }

  Widget findCategory(
    TransactionModel model,
  ) {
    switch (model.transactionType) {
      case TransactionType.Income:
        return IncomeListTile(
          subtitle: model.transactionName.toString(),
          title: formatDateTime(model.transactionDate),
          trailing: Text(
              "${_manager.readString(SharedKeys.currency)}${formatCurrency(model.transactionAmount)}"
                  .toString()),
        );
      case TransactionType.Expense:
        return ExpenseListTile(
          subtitle: model.transactionName.toString(),
          title: formatDateTime(model.transactionDate),
          trailing: Text(
              "${_manager.readString(SharedKeys.currency)}${formatCurrency(model.transactionAmount)}"
                  .toString()),
        );
      case TransactionType.Saving:
        return SavingListTile(
          subtitle: model.transactionName.toString(),
          title: formatDateTime(model.transactionDate),
          trailing: Text(
              "${_manager.readString(SharedKeys.currency)}${formatCurrency(model.transactionAmount)}"
                  .toString()),
        );
      default:
        return const CircularProgressIndicator();
    }
  }
}
