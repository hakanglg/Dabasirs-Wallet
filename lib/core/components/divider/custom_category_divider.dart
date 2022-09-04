import 'package:flutter/material.dart';

class CustomCategoryDivider extends StatelessWidget {
  const CustomCategoryDivider({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 5,
      indent: 20,
      endIndent: 20,
      color: color,
    );
  }
}
