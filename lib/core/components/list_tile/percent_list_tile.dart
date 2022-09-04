import 'package:flutter/material.dart';

import '../../base/base_state.dart';
import '../text/custom_body_text.dart';

class ListTilePercents extends StatelessWidget with BaseState {
  final int percents;
  final String title;
  final Color color;

  ListTilePercents(
      {Key? key,
      required this.percents,
      required this.title,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.circle,
        color: color,
      ),
      title: DefaultBodyText(text: title),
      trailing: DefaultBodyText(
        text: "${percents.toInt()} %",
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
