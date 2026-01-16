import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/core/services/services.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  MyServices myServices = Get.find();
  late String verifyCode;
  @override
  checkCode() {
    verifyCode= myServices.sharedPreferences.getString("token_fcm")!;
  }

  @override
  goToResetPassword() {
    Get.offNamed(AppRoutes.resetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }

}
