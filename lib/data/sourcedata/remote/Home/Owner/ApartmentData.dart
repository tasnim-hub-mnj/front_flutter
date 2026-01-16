import 'package:beyt/core/class/crud.dart';
import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/core/services/services.dart';
import 'package:beyt/linkapi.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApartmentData {
  Crud crud;
  MyServices myServices = Get.find();
  ApartmentData(this.crud);
  postData(
    String city,
    String area,
    String address,
    String price,
    String space,
    String room,
    String bathroom,
    String apartmentPhoto,
    String token,
  ) async {
    final uri = Uri.parse(AppLink.addApartment);
    var request = http.MultipartRequest('POST', uri);
    Map<String, String> data = {
      "city": city,
      "area": area,
      "space": space,
      "address": address,
      "room": room,
      "bath_room": bathroom,
      "price": price,
      "is_available": '0',
    };
    request.files.add(
      await http.MultipartFile.fromPath('image', apartmentPhoto),
    );
    request.headers.addAll({'Authorization': 'Bearer $token'});
    request.fields.addAll(data);
    var response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.offNamed(AppRoutes.myApartments);
      print("success");
    } else {
      Get.defaultDialog(title: "ُWarning", middleText: "Some Thing Is Error");
    }
  }

  putData(
    String city,
    String area,
    String address,
    String price,
    String space,
    String room,
    String bathroom,
    String apartmentPhoto,
    String token,
    String id,
  ) async {
    final uri = Uri.parse("http://10.0.2.2:8000/api/apartment/$id");
    var request = http.MultipartRequest('POST', uri);
    Map<String, String> data = {
      "city": city,
      "area": area,
      "space": space,
      "address": address,
      "room": room,
      "bath_room": bathroom,
      "price": price,
    };
    request.fields.addAll(data);
    if (apartmentPhoto.isNotEmpty) {
      request.files.add(
        await http.MultipartFile.fromPath('image', apartmentPhoto),
      );
    }
    request.headers.addAll({'Authorization': 'Bearer $token'});

    var response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.offNamed(AppRoutes.settingApartment);
      print("success");
    } else {
      Get.defaultDialog(title: "ُWarning", middleText: "Some Thing Is Error");
    }
  }

  getApartment(String token) async {
    var response = await crud.getData(AppLink.getApartment, token);
    return response.fold((l) => l, (r) => r);
  }

  getOneApartment(String token, String id) async {
    var response = await crud.getData(
      "http://10.0.2.2:8000/api/getApartmentWithAllDetailed/$id",
      token,
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteApartment(String id, String token) async {
    var response = await crud.deleteData(
      "http://10.0.2.2:8000/api/apartment/$id",
      token,
    );
    return response.fold((l) => l, (r) => r);
  }
}
