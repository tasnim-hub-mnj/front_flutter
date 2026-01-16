import 'package:beyt/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkPhone();
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController phon;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  checkPhone() {}

  @override
  goToVerifyCode() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.offNamed(AppRoutes.verifyCode);
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    phon = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phon.dispose();
    super.dispose();
  }
}
