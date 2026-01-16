import 'package:beyt/core/class/StatusRequest.dart';
import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/core/services/services.dart';
import 'package:beyt/data/sourcedata/remote/auth/SignUpData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../view/widget/auth/CalendarScreen .dart';

abstract class SignupController extends GetxController {
  Signup();
  GoToSignin();
  showOption(BuildContext context, bool isprofile);
  showCalendarDialog(BuildContext context);
}

class SignupControllerImp extends SignupController {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController birthDay;
  late XFile? personalPhoto;
  late XFile? idPhoto;
  late TextEditingController phon;
  late TextEditingController role;
  late TextEditingController password;
  late StatusRequest statusRequest;
  late String tokenFcm;
  SignUpData signupData = SignUpData(Get.find());
  MyServices myServices = Get.find();
  late DateTime _selectedDate = DateTime.now();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String yourRole = 'No Role';
  bool isShowPassword = true;

  void showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  void showRole(String value) {
    yourRole = value;
    update();
  }

  @override
  Signup() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      signupData.postData(
        phon.text,
        password.text,
        role.text,
        firstName.text,
        lastName.text,
        birthDay.text,
        tokenFcm,
        personalPhoto!,
        idPhoto!,
      );
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  GoToSignin() {
    Get.offNamed(AppRoutes.login);
  }

  Future<void> imageFromGallery(BuildContext context, bool isProfile) async {
    final ImagePicker picker = ImagePicker();
    if (isProfile) {
      personalPhoto = await picker.pickImage(source: ImageSource.gallery);
      Navigator.of(context).pop();
    } else {
      idPhoto = await picker.pickImage(source: ImageSource.gallery);
      Navigator.of(context).pop();
    }
  }

  Future<void> imageFromCamera(BuildContext context, bool isProfile) async {
    final ImagePicker picker = ImagePicker();
    if (isProfile) {
      personalPhoto = await picker.pickImage(source: ImageSource.camera);
      Navigator.of(context).pop();
    } else {
      idPhoto = await picker.pickImage(source: ImageSource.camera);
      Navigator.of(context).pop();
    }
  }

  @override
  showOption(BuildContext context, bool isProfile) {
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
                  imageFromGallery(context, isProfile);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("Camera"),
                onTap: () {
                  imageFromCamera(context, isProfile);
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
    firstName = TextEditingController();
    lastName = TextEditingController();
    birthDay = TextEditingController();
    phon = TextEditingController();
    password = TextEditingController();
    role = TextEditingController();
    tokenFcm = myServices.sharedPreferences.getString("tokenFcm")!;
    super.onInit();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    birthDay.dispose();
    phon.dispose();
    password.dispose();
    role.dispose();
    super.dispose();
  }
}
