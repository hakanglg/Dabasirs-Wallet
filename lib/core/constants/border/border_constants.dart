import 'package:flutter/widgets.dart';

class BorderConstants {
  static BorderConstants instance = BorderConstants._init();
  BorderConstants._init();

  final radiusAllLow = BorderRadius.circular(10);
  final radiusAllNormal = BorderRadius.circular(15);
  final radiusAllHigh = BorderRadius.circular(50);
  final radiusAllMax = BorderRadius.circular(100);

  final radiusRoundedAllLow =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
  final radiusRoundedAllNormal =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));
  final radiusRoundedAllHigh =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(50));

  final radiusTopHigh = const BorderRadius.only(
      topLeft: Radius.circular(50), topRight: Radius.circular(50));
  final radiusTopNormal = const BorderRadius.only(
      topLeft: Radius.circular(15), topRight: Radius.circular(15));
  final radiusTopLow = const BorderRadius.only(
      topLeft: Radius.circular(10), topRight: Radius.circular(10));
}
