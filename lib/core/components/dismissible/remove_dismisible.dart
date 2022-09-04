import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RemoveDismissible extends StatefulWidget {
  final Widget child;
  final Function onDismissed;

  const RemoveDismissible(
      {super.key, required this.onDismissed, required this.child});

  @override
  State<RemoveDismissible> createState() => _RemoveDismissibleState();
}

class _RemoveDismissibleState extends State<RemoveDismissible> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: GlobalKey(),
        direction: DismissDirection.startToEnd,
        background: Container(
          alignment: Alignment.centerLeft,
          color: Colors.red,
          child: Padding(
            padding: context.onlyLeftPaddingNormal,
            child: const Icon(Icons.delete),
          ),
        ),
        onDismissed: (direction) => widget.onDismissed,
        child: widget.child);
  }
}
