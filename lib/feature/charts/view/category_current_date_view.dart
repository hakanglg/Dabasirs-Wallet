 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import '../../../core/constants/enums/amonts_enum.dart';
import '../../../core/util/snackar/amount_stream_selector.dart';
import '../../../product/cache/cache_manager.dart';
import '../../../product/model/transaction.dart';
import '../../../product/widgets/app_bar/transaction_app_bar.dart';
import '../../../product/widgets/listview_builder/animated_listview_builder.dart';
import '../../auth/service/firebase_auth_service.dart';
import '../../helpers/empty_task/empty_task_view.dart';
import '../../helpers/error/error_view.dart';

class CustomCategoryCurrentDateView extends StatefulWidget {
  const CustomCategoryCurrentDateView({
    super.key,
    required this.date,
    required this.category,
    required this.amountType,
  });
  final DateTime date;
  final TransactionType category;
  final AmountType amountType;

  @override
  State<CustomCategoryCurrentDateView> createState() =>
      _CustomCategoryCurrentDateViewState();
}

class _CustomCategoryCurrentDateViewState
    extends State<CustomCategoryCurrentDateView> with BaseState {
  final CacheManager _manager = CacheManager.instance;

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<FirebaseAuthService>().user;

    return Scaffold(
        appBar: TransactionAppBar(),
        body: StreamBuilder<List<TransactionModel>>(
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
                  return transactionList.isEmpty
                      ? EmptyTaskView()
                      : AnimatedListViewBuilder(
                          model: transactionList,
                          user: currentUser,
                        );
                }
              }
            })));
  }

  Widget _loadingWidget() =>
      const Center(child: CircularProgressIndicator.adaptive());
}
