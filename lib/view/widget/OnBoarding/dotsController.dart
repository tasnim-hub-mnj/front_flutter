import 'package:beyt/controller/OnBoarding_Controller.dart';
import 'package:beyt/data/sourcedata/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotsOnBoarding extends StatelessWidget {
  const DotsOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              margin: EdgeInsets.only(top: 30, right: 8),
              duration: Duration(milliseconds: 900),
              width: controller.current == index ? 30 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: controller.current == index
                    ? const Color.fromARGB(255, 236, 107, 71)
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
