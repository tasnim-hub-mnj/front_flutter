import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/core/services/services.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  late String verifyCode;
  late String verifyCodeOnSubmit;

  MyServices myServices = Get.find();

  @override
  checkCode() { 
    verifyCode= myServices.sharedPreferences.getString("verifyCode")!;
    if(verifyCode==verifyCodeOnSubmit){
      //myServices.sharedPreferences.setString("step", "3");
      Get.offNamed(AppRoutes.successSignup);
    }
  }

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignup);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
