import 'dart:convert';

import 'package:beyt/controller/auth/Login_Controller.dart';
import 'package:beyt/core/class/crud.dart';
import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/core/services/services.dart';
import 'package:beyt/linkapi.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserData {
  Crud crud;
  LoginControllerImp controllerImp = Get.put(LoginControllerImp());
  MyServices myServices = Get.find();
  UserData(this.crud);

  putData(
    String firstName,
    String lastName,
    String birthDate,
    String personalPhoto,
    String token,
  ) async {
    final uri = Uri.parse(AppLink.updateProfile);
    var request = http.MultipartRequest('POST', uri);
    Map<String, String> data = {
      "first_name": firstName,
      "last_name": lastName,
      "birth_date": birthDate,
    };
    // ignore: unnecessary_null_comparison
    if (personalPhoto.isNotEmpty) {
      request.files.add(
        await http.MultipartFile.fromPath('personal_photo', personalPhoto),
      );
    }
    request.fields.addAll(data);
    request.headers.addAll({'Authorization': 'Bearer $token'});
    var response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final Map<String, dynamic> responseMap = jsonDecode(responseString);
      controllerImp.user['profile']['first_name'] = firstName;
      controllerImp.user['profile']['last_name'] = lastName;
      controllerImp.user['profile']['birth_date'] = birthDate;
      controllerImp.user['profile']['personal_photo'] =
          responseMap['profile']['personal_photo'];
      Get.offNamed(AppRoutes.ownerProfile);
      
    } else {
      Get.defaultDialog(title: "ُWarning", middleText: "Something is Error");
    }
  }

  deleteData(String token) async {
    var response = await crud.deleteData(AppLink.logout, token);
    return response.fold((l) => l, (r) => r);
  }
}
