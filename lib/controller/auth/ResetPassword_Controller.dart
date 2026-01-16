import 'package:beyt/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccess();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isShowPassword = true;

  void showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  resetPassword() {}

  @override
  goToSuccess() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.offNamed(AppRoutes.success);
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
