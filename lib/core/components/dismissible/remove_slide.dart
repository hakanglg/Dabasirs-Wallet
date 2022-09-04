import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../product/lang/locale_keys.g.dart';

class RemoveSlide extends StatefulWidget {
  const RemoveSlide({super.key, required this.child, required this.onRemove});
  final Widget child;
  final Function(BuildContext)? onRemove;

  @override
  State<RemoveSlide> createState() => _RemoveSlideState();
}

class _RemoveSlideState extends State<RemoveSlide> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: widget.onRemove,
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: LocaleKeys.global_delete.tr(),
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
