import '../../../core/constants/color/color_constants.dart';

import '../../../core/components/row/my_row.dart';
import '../../../core/components/text/custom_subtitle_text.dart';
import '../../../core/components/text/default_title.dart';
import '../model/onboard_model.dart';
import '../view_model/onboard_view_model.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../../product/widgets/app_bar/default_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  late final PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<OnboardProvider>().init();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(),
        body: MyRow(
          child: Column(
            children: [
              Expanded(flex: 6, child: _pageViewBuilder(context)),
              Expanded(
                  flex: 1,
                  child: _buildFooterSection(context, _pageController)),
            ],
          ),
        ));
  }

  PageView _pageViewBuilder(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        onPageChanged: (value) =>
            context.read<OnboardProvider>().nextPage(value),
        itemCount: context.read<OnboardProvider>().onBoardItems.length,
        itemBuilder: (context, index) {
          return _buildBodySection(
              context, context.read<OnboardProvider>().onBoardItems[index]);
        });
  }

  Column _buildBodySection(BuildContext context, OnboardModel model) {
    return Column(
      children: [
        Expanded(flex: 6, child: _buildPicture(model)),
        Expanded(flex: 4, child: _buildTitle(model)),
      ],
    );
  }

  DefaultTitleText _buildTitle(OnboardModel model) {
    return DefaultTitleText(
        text: model.title,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w500);
  }

  Image _buildPicture(OnboardModel model) => Image.asset(model.image);

  Row _buildFooterSection(BuildContext context, PageController controller) {
    return Row(
      children: [
        Expanded(child: _skipButton(controller)),
        Expanded(child: _pageCircleListViewBuilder()),
        Expanded(
            child: context.watch<OnboardProvider>().currentIndex == 3
                ? _doneButton(controller)
                : _nextPageIconButton(controller, context))
      ],
    );
  }

  TextButton _skipButton(PageController controller) {
    return TextButton(
        // onPressed: () => context.read<OnboardProvider>().nextPage(3),
        onPressed: () {
          controller.animateToPage(3,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        },
        child: const DefaultSubtitle(text: LocaleKeys.onBoard_skipText));
  }

  Center _pageCircleListViewBuilder() {
    return Center(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
                padding: context.horizontalPaddingLow,
                child: Icon(
                    context.watch<OnboardProvider>().currentIndex == index
                        ? Icons.circle
                        : Icons.circle_outlined,
                    size: 15));
          }),
    );
  }

  TextButton _doneButton(PageController controller) {
    return TextButton(
        // onPressed: () => context.read<OnboardProvider>().nextPage(3),
        onPressed: () {
          context.read<OnboardProvider>().completeToOnboard(context);
        },
        child: DefaultSubtitle(
          text: LocaleKeys.onBoard_doneText,
          color: ColorConstants.instance.white,
          fontWeight: FontWeight.bold,
        ));
  }

  IconButton _nextPageIconButton(
      PageController controller, BuildContext context) {
    return IconButton(
        icon: Icon(
          CupertinoIcons.arrow_right,
          color: context.appTheme.iconTheme.color,
        ),
        onPressed: () {
          controller.animateToPage(controller.page!.toInt() + 1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        });
  }
}
