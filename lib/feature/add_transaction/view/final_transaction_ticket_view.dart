import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import '../../../core/components/column/my_column.dart';
import '../../../core/components/container/custom_ticket_widget.dart';
import '../../../core/components/row/my_row.dart';
import '../../../core/components/text/custom_subtitle_text.dart';
import '../../../core/components/text/default_title.dart';
import '../../../core/constants/image/image_enums.dart';
import '../../../core/manager/navigation_manager.dart';
import '../../../core/util/snackar/currency_formatter.dart';
import '../../../product/cache/cache_manager.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../../product/model/transaction.dart';
import '../../../product/widgets/app_bar/transaction_app_bar.dart';
import '../../../product/widgets/list_tile/ticket_list_tile.dart';
import '../../tabbar/tabbar.dart';
import '../view_model/add_transaction_provider.dart';

class FinalTransactionTicketView extends StatefulWidget {
  const FinalTransactionTicketView({Key? key}) : super(key: key);
  @override
  State<FinalTransactionTicketView> createState() =>
      _FinalTransactionTicketViewState();
}

class _FinalTransactionTicketViewState extends State<FinalTransactionTicketView>
    with BaseState, NavigatorManager {
  final CacheManager _manager = CacheManager.instance;
  @override
  Widget build(BuildContext context) {
    final addTransactionProvider = context.read<AddTransactionProvider>();
    return Scaffold(
      appBar: TransactionAppBar(
        leadingOnPressed: () =>
            navigateAndRemoveToWidget(context, const TabView()),
        isShowTitle: false,
      ),
      body: MyRow(
        child: MyColumn(
          child: Center(
            child: Column(
              children: [
                Expanded(flex: 2, child: _congratsSection(context)),
                Expanded(
                    flex: 5,
                    child: _ticketSection(addTransactionProvider, context))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _congratsSection(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImageItems.CongratsImage.imagePathPng),
        context.emptySizedHeightBoxLow,
        DefaultTitleText(text: LocaleKeys.addTransaction_congratulation.tr()),
        context.emptySizedHeightBoxLow,
        DefaultSubtitle(text: LocaleKeys.addTransaction_successMessage.tr()),
      ],
    );
  }

  // CustomTicketWidget _ticketSection(
  //     AddTransactionProvider addTransactionProvider, BuildContext context) {
  //   return CustomTicketWidget(
  //     child: Column(
  //       children: [
  //         Expanded(
  //             child: Column(
  //           children: [
  //             Expanded(child: _typeListTile(addTransactionProvider)),
  //             Expanded(child: _nameListTile(addTransactionProvider)),
  //             Expanded(child: _dateListTile(addTransactionProvider)),
  //           ],
  //         )),
  //         Expanded(
  //           child: _amountListTile(addTransactionProvider, context),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  CustomTicketWidget _ticketSection(
      AddTransactionProvider addTransactionProvider, BuildContext context) {
    return CustomTicketWidget(
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(child: _typeListTile(addTransactionProvider)),
              Expanded(child: _nameListTile(addTransactionProvider)),
              Expanded(child: _dateListTile(addTransactionProvider)),
            ],
          )),
          Expanded(
            child: _amountListTile(addTransactionProvider, context),
          ),
        ],
      ),
    );
  }

  TicketListTile _typeListTile(AddTransactionProvider addTransactionProvider) {
    find(BuildContext context) {
      switch (context.read<AddTransactionProvider>().selectedCategory) {
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

    return TicketListTile(
      title: LocaleKeys.addTransaction_transactionType.tr(),
      subtitle: find(context),
    );
  }

  TicketListTile _nameListTile(AddTransactionProvider addTransactionProvider) {
    return TicketListTile(
        title: LocaleKeys.addTransaction_transactionName.tr(),
        subtitle: addTransactionProvider.transactionName.toString());
  }

  TicketListTile _dateListTile(AddTransactionProvider addTransactionProvider) {
    return TicketListTile(
        title: LocaleKeys.addTransaction_date.tr(),
        subtitle: addTransactionProvider.selectDateText.toString());
  }

  Center _amountListTile(
      AddTransactionProvider addTransactionProvider, BuildContext context) {
    return Center(
      child: TicketListTile(
        title: LocaleKeys.addTransaction_amount.tr(),
        currency: _manager.readString(SharedKeys.currency),
        subtitle:
            formatCurrency(addTransactionProvider.transactionAmount).toString(),
        // currency: context.watch<CurrencyNotifier>().currencyUnit,
        subtitleStyle: context.textTheme.headline2!.copyWith(
            color: colorConstants.blueExult, fontWeight: FontWeight.bold),
      ),
    );
  }
}
