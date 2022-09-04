import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../core/components/text/default_title.dart';
import '../../../product/cache/cache_manager.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../../product/model/transaction.dart';
import '../../../product/widgets/app_bar/default_app_bar.dart';
import '../../../product/widgets/listview_builder/animated_listview_builder.dart';
import '../../auth/service/firebase_auth_service.dart';
import '../../helpers/empty_task/empty_task_view.dart';
import '../../helpers/error/error_view.dart';
import '../viewmodel/history_provider.dart';

class HistoryView extends StatelessWidget {
  HistoryView({super.key});
  var uuid = const Uuid();
  final CacheManager _manager = CacheManager.instance;
  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<FirebaseAuthService>().user;
    return Scaffold(
      appBar: DefaultAppBar(),
      body: _streamBuilderWithTitleColumn(context, currentUser),
    );
  }

  Column _streamBuilderWithTitleColumn(BuildContext context, User currentUser) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: context.onlyLeftPaddingMedium,
          child: const DefaultTitleText(text: LocaleKeys.global_transaction),
        ),
        Expanded(
          child: StreamBuilder<List<TransactionModel>>(
              stream: context.read<HistoryProvider>().getTransactionList(),
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return const ErrorView();
                } else {
                  if (!snapshot.hasData) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
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
              })),
        )
      ],
    );
  }
}
