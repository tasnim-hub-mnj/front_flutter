import 'package:beyt/controller/OnBoarding_Controller.dart';
import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/core/services/services.dart';
import 'package:beyt/data/sourcedata/static/static.dart';
import 'package:beyt/view/widget/OnBoarding/dotsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlidOnBoarding extends GetView<OnboardingControllerImp> {
  const SlidOnBoarding({super.key});
  
  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Center(
        child: GestureDetector(
          onTap: controller.next,
          child: controller.current != 2
              ? Stack(
                  children: [
                    Image.asset(
                      onBoardingList[i].image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 400),
                          child: Positioned(
                            child: Text(
                              onBoardingList[i].title!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Positioned(
                            child: Text(
                              onBoardingList[i].body!,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        DotsOnBoarding(),
                      ],
                    ),
                  ],
                )
              : Stack(
                  children: [
                    Image.asset(
                      onBoardingList[i].image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 370),
                          child: Positioned(
                            child: Text(
                              onBoardingList[i].title!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Positioned(
                            child: Text(
                              onBoardingList[i].body!,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        DotsOnBoarding(),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          height: 40,

                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(
                              horizontal: 100,
                              vertical: 0,
                            ),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(20),
                            ),
                            onPressed: () {
                              myServices.sharedPreferences
                                  .setString("step", "1");
                              Get.offAllNamed(AppRoutes.login);
                            },
                            color: const Color.fromARGB(255, 236, 107, 71),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
