import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    } // }else if(myServices.sharedPreferences.getString("step")=="2"){
    //   return const RouteSettings(name: AppRoutes.verifyCodeSignup);
    // }else if(myServices.sharedPreferences.getString("step")=="3"){
    //   return const RouteSettings(name: AppRoutes.login);
    // }
    return null;
  }
}
