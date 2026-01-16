import 'package:beyt/core/class/StatusRequest.dart';
import 'package:beyt/core/functions/handingdatacontroller.dart';
import 'package:beyt/core/services/services.dart';
import 'package:beyt/data/model/Home/Owner/apartmentData.dart';
import 'package:beyt/data/sourcedata/remote/Home/Owner/ApartmentData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class MyApartmentController extends GetxController {
  showOption(BuildContext context);
  addApartment();
  updateApartment(String id);
  getApartments();
  deleteApartment(String id);
  getOneApartments(String id);
}

class MyApartmentControllerImp extends MyApartmentController {
  MyServices myServices = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ApartmentData apartmentData = ApartmentData(Get.find());
  late TextEditingController city;
  late TextEditingController area;
  late TextEditingController address;
  late TextEditingController price;
  late TextEditingController space;
  late TextEditingController room;
  late TextEditingController bathroom;
  late StatusRequest statusRequest;
  late String apartmentPhoto = "";
  String? token;
  List apartment = [];
  List oneApartment = [];
  List rentedApartment = [];
  List unRentedApartment = [];
  String yourCity = 'No City';
  String yourArea = 'No Area';
  String yourRoom = 'No Max';
  String yourRoomBath = 'No Max';
  bool isSP = true;

  void changcoin() {
    isSP = isSP == true ? false : true;
    update();
  }

  @override
  addApartment() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await apartmentData.postData(
        city.text,
        area.text,
        address.text,
        price.text,
        space.text,
        room.text,
        bathroom.text,
        apartmentPhoto,
        token!,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        apartment.clear();
        getApartments();
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  updateApartment(String id) async {
    if (address.text.isEmpty) {
      address.text = Apartment.fromJson(oneApartment[0]).address!;
    }
    if (price.text.isEmpty) {
      price.text = Apartment.fromJson(oneApartment[0]).price!;
    }
    if (space.text.isEmpty) {
      space.text = Apartment.fromJson(oneApartment[0]).space!;
    }
    if (city.text.isEmpty) {
      city.text = Apartment.fromJson(oneApartment[0]).city!;
    }
    if (area.text.isEmpty) {
      area.text = Apartment.fromJson(oneApartment[0]).area!;
    }
    if (room.text.isEmpty) {
      room.text = Apartment.fromJson(oneApartment[0]).room!;
    }
    if (bathroom.text.isEmpty) {
      bathroom.text = Apartment.fromJson(oneApartment[0]).bathroom!;
    }
    statusRequest = StatusRequest.loading;
    var response = await apartmentData.putData(
      city.text,
      area.text,
      address.text,
      price.text,
      space.text,
      room.text,
      bathroom.text,
      apartmentPhoto,
      token!,
      id,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      apartment.clear();
      rentedApartment.clear();
      unRentedApartment.clear();
      oneApartment.clear();
      getApartments();
    }
    update();
  }

  @override
  getApartments() async {
    statusRequest = StatusRequest.loading;
    var response = await apartmentData.getApartment(token!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      apartment.addAll(response['apartments']);
      List.generate(
        apartment.length,
        (index) => Apartment.fromJson(apartment[index]).isAvailable == 1
            ? rentedApartment.add(apartment[index])
            : null,
      );
      List.generate(
        apartment.length,
        (index) => Apartment.fromJson(apartment[index]).isAvailable == 0
            ? unRentedApartment.add(apartment[index])
            : null,
      );
    }
    update();
  }

  @override
  getOneApartments(String id) async {
    statusRequest = StatusRequest.loading;
    var response = await apartmentData.getOneApartment(token!, id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      oneApartment.add(response['apartments']);
    }
    update();
  }

  @override
  deleteApartment(String id) async {
    statusRequest = StatusRequest.loading;
    var response = await apartmentData.deleteApartment(id, token!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      apartment.clear();
      getApartments();
      print("success");
      update();
    }
  }

  void showCity(String value) {
    yourCity = value;
    update();
  }

  void showArea(String value) {
    yourArea = value;
    update();
  }

  void showRoom(String value) {
    yourRoom = value;
    update();
  }

  void showBathRoom(String value) {
    yourRoomBath = value;
    update();
  }

  Future<void> imageFromGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    late XFile? photo;
    photo = await picker.pickImage(source: ImageSource.camera);
    apartmentPhoto = photo!.path;
    Navigator.of(context).pop();
  }

  Future<void> imageFromCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    late XFile? photo;
    photo = await picker.pickImage(source: ImageSource.camera);
    apartmentPhoto = photo!.path;
    Navigator.of(context).pop();
  }

  @override
  showOption(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Choose"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Gallery"),
                onTap: () {
                  imageFromGallery(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("Camera"),
                onTap: () {
                  imageFromCamera(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onInit() {
    token = myServices.sharedPreferences.getString("Token");
    city = TextEditingController();
    area = TextEditingController();
    address = TextEditingController();
    price = TextEditingController();
    room = TextEditingController();
    bathroom = TextEditingController();
    space = TextEditingController();
    getApartments();
    super.onInit();
  }

  @override
  void dispose() {
    city.dispose();
    area.dispose();
    address.dispose();
    price.dispose();
    space.dispose();
    room.dispose();
    bathroom.dispose();
    super.dispose();
  }
}
