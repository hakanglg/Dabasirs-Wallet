import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/components/list_tile/custom_category_list_tile.dart';
import '../../../core/constants/color/color_constants.dart';
import '../../../core/constants/image/image_enums.dart';
import '../../../core/util/snackar/currency_formatter.dart';
import '../../../feature/add_transaction/view_model/add_transaction_provider.dart';
import '../../cache/cache_manager.dart';
import '../../lang/locale_keys.g.dart';

class AmountListTile extends StatelessWidget {
  AmountListTile({super.key});
  final CacheManager _manager = CacheManager.instance;

  @override
  Widget build(BuildContext context) {
    return CustomCategoryListTile(
      color: ColorConstants.instance.white,
      title: LocaleKeys.addTransaction_amount.tr(),
      subtitle:
          "${_manager.readString(SharedKeys.currency)}${formatCurrency(context.watch<AddTransactionProvider>().transactionAmount).toString()}",
      imagePath: ImageItems.AmountLogo.imagePathPng,
    );
  }
}
