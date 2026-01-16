import 'package:beyt/core/class/crud.dart';
import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/core/services/services.dart';
import 'package:beyt/linkapi.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class SignUpData {
  Crud crud;
  MyServices myServices = Get.find();
  SignUpData(this.crud);

  postData(
    String phone,
    String password,
    String role,
    String firstName,
    String lastName,
    String birthDate,
    String tokenFcm,
    XFile personalPhoto,
    XFile idPhoto,
  ) async {
    final uri = Uri.parse(AppLink.signUp);
    var request = http.MultipartRequest('POST', uri);
    Map<String, String> data = {
      "phone": phone,
      "password": password,
      "role": role,
      "first_name": firstName,
      "last_name": lastName,
      "birth_date": birthDate,
      "token_fcm": tokenFcm,
    };
    request.files.add(
      await http.MultipartFile.fromPath('personal_photo', personalPhoto.path),
    );
    request.files.add(
      await http.MultipartFile.fromPath('identity_photo', idPhoto.path),
    );
    request.fields.addAll(data);
    var response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      //myServices.sharedPreferences.setString("step", "2");
      Get.offNamed(AppRoutes.verifyCodeSignup);
      print("success");
    } else {
      Get.defaultDialog(
        title: "ُWarning",
        middleText: "Phone Number Already Exists",
      );
    }
  }
}
