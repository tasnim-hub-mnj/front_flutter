import 'package:beyt/controller/auth/Login_Controller.dart';
import 'package:beyt/core/class/StatusRequest.dart';
import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/core/functions/handingdatacontroller.dart';
import 'package:beyt/core/services/services.dart';
import 'package:beyt/data/model/Home/user.dart';
import 'package:beyt/data/sourcedata/remote/Home/UserDate.dart';
import 'package:beyt/view/widget/auth/CalendarScreen%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

abstract class ProfileController extends GetxController {
  updateProfile();
  logOut();
  showOption(BuildContext context);
  showCalendarDialog(BuildContext context);
}

class ProfileControllerImp extends ProfileController {
  MyServices myServices = Get.find();
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController birthDay;
  late DateTime _selectedDate = DateTime.now();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  LoginControllerImp controllerImp = Get.put(LoginControllerImp());

  UserData userData = UserData(Get.find());
  late StatusRequest statusRequest;
  late String personalPhoto = "";
  String? token;

  @override
  updateProfile() async {
    if (firstName.text.isEmpty) {
      firstName.text = User.fromJson(controllerImp.user['profile']).firstName!;
    }
    if (lastName.text.isEmpty) {
      lastName.text = User.fromJson(controllerImp.user['profile']).lastName!;
    }
    if (birthDay.text.isEmpty) {
      birthDay.text = User.fromJson(controllerImp.user['profile']).birthday!;
    }
    statusRequest = StatusRequest.loading;
    userData.putData(
      firstName.text,
      lastName.text,
      birthDay.text,
      personalPhoto,
      token!,
    );
    update();
  }

  @override
  logOut() async {
    statusRequest = StatusRequest.loading;
    var response = await userData.deleteData(token!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      myServices.sharedPreferences.clear();
      Get.offNamed(AppRoutes.login);
    }
    update();
  }

  Future<void> imageFromGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    late XFile? photo;
    photo = await picker.pickImage(source: ImageSource.gallery);
    personalPhoto = photo!.path;
    Navigator.of(context).pop();
  }

  Future<void> imageFromCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    late XFile? photo;
    photo = await picker.pickImage(source: ImageSource.camera);
    personalPhoto = photo!.path;
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
  void showCalendarDialog(BuildContext context) async {
    final DateTime? picked = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: 300,
            height: 350,
            child: MonthView(initialDate: _selectedDate),
          ),
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      birthDay.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
    }
  }

  @override
  void onInit() {
    token = myServices.sharedPreferences.getString("Token");
    firstName = TextEditingController();
    lastName = TextEditingController();
    birthDay = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    birthDay.dispose();
    super.dispose();
  }
}
