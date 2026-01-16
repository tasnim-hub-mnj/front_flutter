import 'package:beyt/controller/OnBoarding_Controller.dart';
import 'package:beyt/view/widget/OnBoarding/SlidOnBoarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SlidOnBoarding()
            ),
          ],
        ),
      ),
    );
  }
}
