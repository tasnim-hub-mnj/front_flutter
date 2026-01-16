import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/core/localization/ChangeLocal.dart';
import 'package:beyt/view/widget/Language/buttonLang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: 25),
            ButtonLang(
              textbutton: "Ar",
              onPressed: () {
                controller.ChangeLang("ar");
                Get.offNamed(AppRoutes.onBoarding);
              },
            ),
            ButtonLang(
              textbutton: "En",
              onPressed: () {
                controller.ChangeLang("en");
                Get.offNamed(AppRoutes.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
