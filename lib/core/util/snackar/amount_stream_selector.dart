import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../feature/charts/view_model/charts_provider.dart';
import '../../../product/model/transaction.dart';
import '../../constants/enums/amonts_enum.dart';

Stream<List<TransactionModel>>? StreamSelector(
  AmountType type,
  BuildContext context,
  TransactionType category,
  DateTime date,
) {
  switch (type) {
    case AmountType.All:
      return context
          .read<ChartsProvider>()
          .getAllTransactionSingleCategory(category);
    case AmountType.Year:
      return context
          .read<ChartsProvider>()
          .getAllTransactionSingleCategoryWithCurrentYear(date, category);
    case AmountType.Month:
      return context
          .read<ChartsProvider>()
          .getAllTransactionSingleCategoryWithWithCurrentMonth(date, category);
  }
}
