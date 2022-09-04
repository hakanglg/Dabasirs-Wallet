import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/base/base_state.dart';
import '../../../core/constants/lottie/lottie_enum.dart';

class EmptyTaskView extends StatelessWidget with BaseState {
  EmptyTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(LottieItems.empty.lottiePath),
      ),
    );
  }
}
