import 'package:intl/intl.dart';

formatCurrency(double? currency) {
  return NumberFormat().format(currency);
}


// return NumberFormat.simpleCurrency(locale: Platform.localeName)
      // .format(currency);