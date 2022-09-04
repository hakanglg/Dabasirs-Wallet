import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/base_state.dart';

class TicketListTile extends StatelessWidget with BaseState {
  TicketListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.currency,
    this.subtitleStyle,
  });
  final String title;
  final String subtitle;
  final String? currency;
  final TextStyle? subtitleStyle;

// Text(find(context)),
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: context.textTheme.subtitle2),
      subtitle: Text(
        "${currency ?? ""}${subtitle.toTitleCase()}",
        style: subtitleStyle ??
            context.textTheme.headline5!.copyWith(
                color: colorConstants.blueExult, fontWeight: FontWeight.bold),
      ),
    );
  }
}
