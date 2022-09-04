import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/base_state.dart';
import '../../../feature/auth/service/firebase_auth_service.dart';
import '../../lang/locale_keys.g.dart';

class DeleteAccountAlert extends StatelessWidget with BaseState {
  DeleteAccountAlert({super.key});

  final FirebaseAuthService _auth = FirebaseAuthService(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    return context.isIOSDevice
        ? _cupertinoDeleteAccontAlertDialog(context)
        : _androidDeleteAccountSimpleDialog(context);
  }

  _androidDeleteAccountSimpleDialog(BuildContext context) {
    return AlertDialog(
      title: _androidAlertTitle(context),
      actions: [
        Row(
          children: [
            Expanded(
              child: _androidCancelButton(context),
            ),
            Expanded(
              child: _androidDeleteButton(context),
            ),
          ],
        )
      ],
    );
  }

  Text _androidAlertTitle(BuildContext context) {
    return Text(
      LocaleKeys.profile_alertTitle.tr(),
      style: context.textTheme.bodyText1!.copyWith(color: colorConstants.black),
    );
  }

  TextButton _androidCancelButton(BuildContext context) {
    return TextButton(
        child: Text(LocaleKeys.profile_cancel.tr(),
            style: TextStyle(
                color: colorConstants.metroidRed, fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        });
  }

  TextButton _androidDeleteButton(BuildContext context) {
    return TextButton(
      child: Text(LocaleKeys.global_delete.tr()),
      onPressed: () async {
        Navigator.of(context, rootNavigator: true).pop();
        await _auth.deleteAccount(context);
      },
    );
  }

// !!
  CupertinoAlertDialog _cupertinoDeleteAccontAlertDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        LocaleKeys.profile_alertTitle.tr(),
      ),
      key: UniqueKey(),
      actions: [
        _iosCancelButton(context),
        _iosDeleteButton(context),
      ],
    );
  }

  CupertinoDialogAction _iosCancelButton(BuildContext context) {
    return CupertinoDialogAction(
        child: Text(
          LocaleKeys.profile_cancel.tr(),
          style: TextStyle(color: colorConstants.metroidRed),
        ),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        });
  }

  CupertinoDialogAction _iosDeleteButton(BuildContext context) {
    return CupertinoDialogAction(
      child: Text(LocaleKeys.global_delete.tr()),
      onPressed: () async {
        Navigator.of(context, rootNavigator: true).pop();
        await _auth.deleteAccount(context);
      },
    );
  }
}
