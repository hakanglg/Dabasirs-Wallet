import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import '../../../feature/auth/view_model/auth_provider.dart';

class LogoutIconButton extends StatelessWidget with BaseState {
  LogoutIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: colorConstants.metroidRed,
        onPressed: () {
          context.read<AuthViewModel>().signOut(context);
        },
        icon: const Icon(Icons.logout_outlined));
  }
}
