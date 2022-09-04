import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import '../../../core/components/divider/custom_category_divider.dart';
import '../../../core/components/row/my_row.dart';
import '../../../core/manager/navigation_manager.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../../product/model/transaction.dart';
import '../../../product/widgets/app_bar/transaction_app_bar.dart';
import '../../../product/widgets/container/glassify_category_container.dart';
import '../../../product/widgets/stepper/progress_stepper.dart';
import '../view_model/add_transaction_provider.dart';
import 'transaction_name_view.dart';

class SelectCategoryView extends StatelessWidget
    with BaseState, NavigatorManager {
  SelectCategoryView({super.key});
  final int _currentStep = 1;
  @override
  Widget build(BuildContext context) {
    // context.setLocale(const Locale("en", "US"));
    // context.setLocale(const Locale("tr", "TUR"));
    return Scaffold(
        appBar: TransactionAppBar(),
        body: MyRow(
          child: Column(
            children: [
              ProgressStepper(
                currentStep: _currentStep,
              ),
              const Spacer(),
              Expanded(child: _titleText(context)),
              Expanded(child: _incomeGlassContainer(context)),
              context.emptySizedHeightBoxNormal,
              Expanded(child: _expenseGlassContainer(context)),
              context.emptySizedHeightBoxNormal,
              Expanded(child: _savingGlassContainer(context)),
              context.emptySizedHeightBoxNormal,
            ],
          ),
        ));
  }

  Text _titleText(BuildContext context) {
    return Text(
      LocaleKeys.addTransaction_addTransactionTitle.tr(),
      textAlign: TextAlign.left,
      style: context.textTheme.headline3,
    );
  }

  GlassifyCategoryContainer _savingGlassContainer(BuildContext context) {
    return GlassifyCategoryContainer(
      onTap: () {
        context
            .read<AddTransactionProvider>()
            .setSelectedCategory(TransactionType.Saving);
        navigateToWidget(context, const TransactionNameView());
      },
      title: LocaleKeys.addTransaction_saving,
      child: _savingDivider,
    );
  }

  GlassifyCategoryContainer _expenseGlassContainer(BuildContext context) {
    return GlassifyCategoryContainer(
      onTap: () {
        context
            .read<AddTransactionProvider>()
            .setSelectedCategory(TransactionType.Expense);
        navigateToWidget(context, const TransactionNameView());
      },
      title: LocaleKeys.addTransaction_expense,
      child: _expenseDivider,
    );
  }

  GlassifyCategoryContainer _incomeGlassContainer(BuildContext context) {
    return GlassifyCategoryContainer(
      onTap: () {
        context
            .read<AddTransactionProvider>()
            .setSelectedCategory(TransactionType.Income);
        navigateToWidget(context, const TransactionNameView());
      },
      title: LocaleKeys.addTransaction_income,
      child: _incomeDivider,
    );
  }

  Widget get _incomeDivider => CustomCategoryDivider(
        color: colorConstants.caribbienGreen,
      );
  Widget get _expenseDivider => CustomCategoryDivider(
        color: colorConstants.metroidRed,
      );
  Widget get _savingDivider => CustomCategoryDivider(
        color: colorConstants.shadyNeonBlue,
      );
}
