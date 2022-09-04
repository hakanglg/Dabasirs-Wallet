import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../base/base_state.dart';

class CustomTicketWidget extends StatelessWidget with BaseState {
  final Widget child;

  CustomTicketWidget({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: TicketWidget(
        isCornerRounded: true,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: ShapeDecoration(
                shape: borderConstants.radiusRoundedAllNormal,
                color: Colors.white),
            child: child),
      ),
    );
  }
}
