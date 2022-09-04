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
import '../../../product/widgets/tabbar/tabbar_month.dart';

class MonthlyView extends StatefulWidget {
  MonthlyView({super.key});

  late double sum = 0;
  @override
  State<MonthlyView> createState() => _HomeViewState();
}

class _HomeViewState extends State<MonthlyView>
    with BaseState, TickerProviderStateMixin {
  late TabController _tabController;
  late final _now;
  final myTabsLength = 12;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _tabController = TabController(vsync: this, length: myTabsLength);
    final currentMon = _now.month - 1;
    _tabController.index = currentMon;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabController.length,
        child: Scaffold(
          appBar: AppbarMonthsTab(controller: _tabController),
          body: TabBarView(
            controller: _tabController,
            children: List.generate(
                _tabController.length,
                (index) => MyRow(
                      child: MyColumn(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DefaultTitleText(
                                text: LocaleKeys.global_monthly),
                            context.emptySizedHeightBoxNormal,
                            Expanded(
                              flex: 2,
                              child: _monthlyIncomeCard(index),
                            ),
                            context.emptySizedHeightBoxLow3x,
                            Expanded(
                              flex: 2,
                              child: _monthlyExpenseCard(index),
                            ),
                            context.emptySizedHeightBoxLow3x,
                            Expanded(
                              flex: 2,
                              child: _monthlySavingCard(index),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    )),
          ),
        ));
  }

  SingleCategoryTotalAmountGlassifyCard _monthlyIncomeCard(int index) {
    return SingleCategoryTotalAmountGlassifyCard(
      amountType: AmountType.Month,
      date: DateTime(_now.year, index + 1),
      category: TransactionType.Income,
    );
  }

  SingleCategoryTotalAmountGlassifyCard _monthlyExpenseCard(int index) {
    return SingleCategoryTotalAmountGlassifyCard(
      amountType: AmountType.Month,
      date: DateTime(_now.year, index + 1),
      category: TransactionType.Expense,
    );
  }

  SingleCategoryTotalAmountGlassifyCard _monthlySavingCard(int index) {
    return SingleCategoryTotalAmountGlassifyCard(
      amountType: AmountType.Month,
      date: DateTime(_now.year, index + 1),
      category: TransactionType.Saving,
    );
  }
}
