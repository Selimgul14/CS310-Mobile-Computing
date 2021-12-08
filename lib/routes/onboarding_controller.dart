import 'package:flutter/material.dart';
import 'package:project/routes/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      //go to home page
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/breakingnews.jpg', 'Be Informed',
        'Get the latest developments instantly.'),
    OnboardingInfo('assets/images/world.jpg', 'The World is at your fingertips',
        'Do not stay behind whats going on in the world'),
    OnboardingInfo('assets/images/comment.png', 'Interact with others',
        'You can share your thoughts with others')
  ];
}