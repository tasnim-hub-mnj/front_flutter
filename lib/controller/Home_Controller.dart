import 'package:beyt/core/services/services.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? id;
  String? username;
  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
  
  @override
  getData() {
    
    throw UnimplementedError();
  }
}
