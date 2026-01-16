import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnboardingControllerImp extends OnboardingController {
  int current = 0;
  late PageController pageController;
  @override
  next() {
    current++;
    pageController.animateToPage(
      current,
      duration: Duration(milliseconds: 900),
      curve: Curves.easeInOut,
    );
  }

  @override
  onPageChanged(int index) {
    current = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
