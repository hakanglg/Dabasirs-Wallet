import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

import '../../../core/base/base_state.dart';

class ProgressStepper extends StatelessWidget with BaseState {
  ProgressStepper({super.key, required this.currentStep});
  final int _maxSteps = 4;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return LinearProgressBar(
      maxSteps: _maxSteps,
      progressType: LinearProgressBar.progressTypeLinear, // Use Linear progress
      currentStep: currentStep,
      progressColor: colorConstants.shadyNeonBlue,
      backgroundColor: colorConstants.black,
    );
  }
}
