import 'package:beyt/core/class/StatusRequest.dart';
import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beyt/data/sourcedata/remote/auth/LoginData.dart';
import 'package:beyt/core/functions/handingdatacontroller.dart';

abstract class LoginController extends GetxController {
  Login();
  goToSignup();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController phon;
  late TextEditingController password;
  late StatusRequest statusRequest;
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  bool isShowPassword = true;
  Map user = {};
  void showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  Login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      var formData = formState.currentState;
      if (formData!.validate()) {
        statusRequest = StatusRequest.loading;
        var response = await loginData.postData(phon.text, password.text);
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['message'] == "User Logged In Successfully") {
            myServices.sharedPreferences.setString(
              "role",
              response['User']['role'],
            );
            myServices.sharedPreferences.setString("Token", response['Token']);
            if (myServices.sharedPreferences.getString("role") == "owner") {
              user.addAll(response['User']);
              Get.toNamed(AppRoutes.myApartments);
            } else {
              user.addAll(response);
              Get.toNamed(AppRoutes.search);
            }
          } else {
            Get.defaultDialog(
              title: "ُWarning",
              middleText: "Phone Number our Password is Error",
            );
            statusRequest = StatusRequest.failure;
          }
        }
        update();
      } else {
        print("Not Valid");
      }
    }
  }

  @override
  goToSignup() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoutes.forgetPassword);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      myServices.sharedPreferences.setString("tokenFcm", value!);
    });
    phon = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phon.dispose();
    password.dispose();
    super.dispose();
  }
}
