import 'package:flutter/material.dart';

void showAlertDialogCustom(BuildContext context, Widget child) async {
  showDialog(
      context: context,
      builder: (context) {
        return child;
      });
}
