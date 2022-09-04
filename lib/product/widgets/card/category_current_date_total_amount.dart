import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/base_state.dart';
import '../../../core/components/column/my_column.dart';
import '../../../core/components/container/custom_glassify_container.dart';
import '../../../core/components/row/my_row.dart';
import '../../../core/constants/enums/amonts_enum.dart';
import '../../../core/manager/navigation_manager.dart';
import '../../../core/util/snackar/amount_stream_selector.dart';
import '../../../core/util/snackar/currency_formatter.dart';
import '../../../feature/charts/view/category_current_date_view.dart';
import '../../../feature/helpers/error/error_view.dart';
import '../../cache/cache_manager.dart';
import '../../lang/locale_keys.g.dart';
import '../../model/transaction.dart';

class SingleCategoryTotalAmountGlassifyCard extends StatefulWidget {
  late double sum = 0;
  final DateTime date;
  final TransactionType category;
  final AmountType amountType;

  SingleCategoryTotalAmountGlassifyCard({
    super.key,
    required this.date,
    required this.category,
    required this.amountType,
  });

  @override
  State<SingleCategoryTotalAmountGlassifyCard> createState() =>
      _SingleCategoryWithCurrentDateStateStream();
}

class _SingleCategoryWithCurrentDateStateStream
    extends State<SingleCategoryTotalAmountGlassifyCard>
    with BaseState, NavigatorManager {
  final CacheManager _manager = CacheManager.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TransactionModel>>(
        stream: StreamSelector(
          widget.amountType,
          context,
          widget.category,
          widget.date,
        ),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return const ErrorView();
          } else {
            if (!snapshot.hasData) {
              return _loadingWidget();
            } else {
              List<TransactionModel> transactionList = snapshot.data!;
              widget.sum = transactionList.fold(
                  0,
                  (previousValue, element) =>
                      previousValue + element.transactionAmount!);

              return _CustomGlassifyContainerTotalAmonth(context);
            }
          }
        }));
  }

  InkWell _CustomGlassifyContainerTotalAmonth(BuildContext context) {
    return InkWell(
      onTap: () => navigateToWidget(
          context,
          CustomCategoryCurrentDateView(
            date: widget.date,
            category: widget.category,
            amountType: widget.amountType,
          )),
      child: _glassifyContainer(context),
    );
  }

  CustomGlassifyContainer _glassifyContainer(BuildContext context) {
    return CustomGlassifyContainer(
      widget: MyColumn(
        child: MyRow(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _categoryName(context),
            const Spacer(),
            _amount(context),
            _dividerWithCategoryColor(),
          ]),
        ),
      ),
    );
  }

  Text _categoryName(BuildContext context) {
    return Text(transactionCategoryName(), style: context.textTheme.headline5!);
  }

  Text _amount(BuildContext context) {
    return Text(
      "${_manager.readString(SharedKeys.currency)}${formatCurrency(widget.sum).toString()} ",
      style: context.textTheme.bodyText1,
    );
  }

  Divider _dividerWithCategoryColor() {
    return Divider(
      color: transactionCategoryColor(),
      thickness: 4,
    );
  }

  String transactionCategoryName() {
    switch (widget.category) {
      case TransactionType.Expense:
        return LocaleKeys.addTransaction_expense.tr();
      case TransactionType.Income:
        return LocaleKeys.addTransaction_income.tr();
      case TransactionType.Saving:
        return LocaleKeys.addTransaction_saving.tr();
      default:
        return '';
    }
  }

  Color transactionCategoryColor() {
    switch (widget.category) {
      case TransactionType.Expense:
        return colorConstants.metroidRed;
      case TransactionType.Income:
        return colorConstants.caribbienGreen;
      case TransactionType.Saving:
        return colorConstants.shadyNeonBlue;
    }
  }

  Widget _loadingWidget() =>
      const Center(child: CircularProgressIndicator.adaptive());
}
