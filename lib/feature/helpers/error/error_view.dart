import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/lottie/lottie_enum.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(LottieItems.error.lottiePath),
      ),
    );
  }
}
