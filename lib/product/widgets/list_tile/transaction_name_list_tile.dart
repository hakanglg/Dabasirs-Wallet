import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/components/list_tile/custom_category_list_tile.dart';
import '../../../core/constants/color/color_constants.dart';
import '../../../core/constants/image/image_enums.dart';
import '../../../feature/add_transaction/view_model/add_transaction_provider.dart';
import '../../lang/locale_keys.g.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCategoryListTile(
      color: ColorConstants.instance.white,
      title: LocaleKeys.addTransaction_transactionName.tr(),
      subtitle:
          context.read<AddTransactionProvider>().transactionName.toUpperCase(),
      imagePath: ImageItems.TransactionNameLogo.imagePathPng,
    );
  }
}
