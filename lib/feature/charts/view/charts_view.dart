import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/base_state.dart';
import '../../../core/components/column/my_column.dart';
import '../../../core/components/row/my_row.dart';
import '../../../core/components/text/default_title.dart';
import '../../../core/constants/enums/amonts_enum.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../../product/model/transaction.dart';
import '../../../product/widgets/card/category_current_date_total_amount.dart';
import '../../../product/widgets/tabbar/tabbar_years.dart';

class ChartsView extends StatefulWidget {
  ChartsView({Key? key}) : super(key: key);
  late double sum = 0;
  @override
  State<ChartsView> createState() => _ChartsViewState();
}

class _ChartsViewState extends State<ChartsView>
    with BaseState, TickerProviderStateMixin {
  late TabController _tabController;
  late final _now;
  final myTabsLength = 3;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _tabController = TabController(vsync: this, length: myTabsLength);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(DateTime(_now.year).toString());
    return DefaultTabController(
        length: _tabController.length,
        child: Scaffold(
            appBar: AppbarYearTab(
              controller: _tabController,
            ),
            body: TabBarView(
                controller: _tabController,
                children: List.generate(_tabController.length, (index) {
                  return MyRow(
                    child: MyColumn(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          _yearlyTotalTitleText(),
                          context.emptySizedHeightBoxLow3x,
                          Expanded(
                            child: _incomeYearlyAmountCard(index),
                          ),
                          context.emptySizedHeightBoxLow3x,
                          Expanded(
                            child: _expenseYearlyAmountCard(index),
                          ),
                          context.emptySizedHeightBoxLow3x,
                          Expanded(
                            child: _savingYearlyAmountCard(index),
                          ),
                          context.emptySizedHeightBoxLow3x,
                          _allTimeTotalTitleText(),
                          context.emptySizedHeightBoxLow3x,
                          Expanded(
                            child: _allTimeTotalAmountsListView(context, index),
                          ),
                        ])),
                  );
                }))));
  }

  DefaultTitleText _yearlyTotalTitleText() =>
      const DefaultTitleText(text: LocaleKeys.global_yearly);

  SingleCategoryTotalAmountGlassifyCard _incomeYearlyAmountCard(int index) {
    return SingleCategoryTotalAmountGlassifyCard(
      amountType: AmountType.Year,
      date: DateTime(_now.year + index),
      category: TransactionType.Income,
    );
  }

  SingleCategoryTotalAmountGlassifyCard _expenseYearlyAmountCard(int index) {
    return SingleCategoryTotalAmountGlassifyCard(
      amountType: AmountType.Year,
      date: DateTime(_now.year + index),
      category: TransactionType.Expense,
    );
  }

  SingleCategoryTotalAmountGlassifyCard _savingYearlyAmountCard(int index) {
    return SingleCategoryTotalAmountGlassifyCard(
      amountType: AmountType.Year,
      date: DateTime(_now.year + index),
      category: TransactionType.Saving,
    );
  }

  DefaultTitleText _allTimeTotalTitleText() =>
      const DefaultTitleText(text: LocaleKeys.global_all);

  ListView _allTimeTotalAmountsListView(BuildContext context, int index) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _allTimeTotalIncomeCard(context, index),
        context.emptySizedWidthBoxNormal,
        _allTimeTotalExpenseCard(context, index),
        context.emptySizedWidthBoxNormal,
        _allTimeTotalSavingCard(context, index),
      ],
    );
  }

  SizedBox _allTimeTotalIncomeCard(BuildContext context, int index) {
    return SizedBox(
      width: context.dynamicWidth(.7),
      child: SingleCategoryTotalAmountGlassifyCard(
        amountType: AmountType.All,
        date: DateTime(_now.year + index),
        category: TransactionType.Income,
      ),
    );
  }

  SizedBox _allTimeTotalExpenseCard(BuildContext context, int index) {
    return SizedBox(
      width: context.dynamicWidth(.7),
      child: SingleCategoryTotalAmountGlassifyCard(
        amountType: AmountType.All,
        date: DateTime(_now.year + index),
        category: TransactionType.Expense,
      ),
    );
  }

  SizedBox _allTimeTotalSavingCard(BuildContext context, int index) {
    return SizedBox(
      width: context.dynamicWidth(.7),
      child: SingleCategoryTotalAmountGlassifyCard(
        amountType: AmountType.All,
        date: DateTime(_now.year + index),
        category: TransactionType.Saving,
      ),
    );
  }
}
