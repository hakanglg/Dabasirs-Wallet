import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/base_state.dart';
import '../../../core/components/container/custom_glassify_container.dart';

class GlassifyCategoryContainer extends StatelessWidget with BaseState {
  GlassifyCategoryContainer(
      {super.key, required this.child, required this.title, this.onTap});
  final Widget child;
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomGlassifyContainer(
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding: context.paddingNormal,
              child: Text(title.tr()),
            )),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
