import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:smarttaskmanager/constants/app_image.dart';
import 'package:smarttaskmanager/constants/app_string.dart';
import 'package:smarttaskmanager/utils/screen_util.dart';
import 'package:stacked/stacked.dart';

import 'onboard_view_model.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {

  final PageDecoration pageDecoration = const PageDecoration(
    bodyPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10.0),
    imagePadding: EdgeInsets.zero,
    pageMargin: EdgeInsets.only(bottom: 20.0),
  );

  Widget _buildImage(
      {required BuildContext context, required String assetName}) {
    return Center(
      child: Image.asset(
        assetName,
        height: ScreenUtil.screenHeightFraction(context, dividedBy: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardViewModel>.reactive(
      onViewModelReady: (model) => model.initialize(),
      viewModelBuilder: () => OnboardViewModel(),
      builder: (context, model, child) =>
          IntroductionScreen(
            pages: [
              PageViewModel(
                title: AppString.textTitlePage1,
                body: AppString.textDescriptionPage1,
                image: _buildImage(
                    context: context, assetName: AppImage.stress1),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: AppString.textTitlePage2,
                body: AppString.textDescriptionPage2,
                image: _buildImage(
                    context: context, assetName: AppImage.stress2),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: AppString.textTitlePage2,
                body: AppString.textDescriptionPage2,
                image: _buildImage(
                    context: context, assetName: AppImage.time1),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: AppString.textTitlePage3,
                body: AppString.textDescriptionPage3,
                image: _buildImage(
                    context: context, assetName: AppImage.time2),
                decoration: pageDecoration,
              ),
            ],
            onDone: () => model.onIntroEnd(),
            onSkip: () => model.onIntroEnd(),
            showSkipButton: true,
            skip: const Text(AppString.textSkip),
            next: const Icon(Icons.arrow_forward),
            done: const Text(
              AppString.textCompleteOnboard,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            dotsFlex: 3,
            dotsDecorator: const DotsDecorator(
              size: Size(5.0, 5.0),
              color: Color(0xFFBDBDBD),
              activeSize: Size(22.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
    );
  }
}