import 'package:beyt/controller/Home/Owner/Profile_Controller.dart';
import 'package:beyt/controller/auth/Login_Controller.dart';
import 'package:beyt/core/functions/ValidInput.dart';
import 'package:beyt/data/model/Home/user.dart';
import 'package:beyt/linkapi.dart';
import 'package:beyt/view/widget/auth/ButtonAuth.dart';
import 'package:beyt/view/widget/auth/TextFieldAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileControllerImp controller = Get.put(ProfileControllerImp());
    LoginControllerImp controllerImp = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Update Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.grey,
          ),
        ),
      ),
      // ignore: deprecated_member_use
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: ListView(
          children: [
            SizedBox(height: 60),
            TextFieldAuth(
              isSucre: false,
              isNumber: false,
              valid: (val) {
                return validInput(val!, 3, 20, "firstName");
              },
              myController: controller.firstName,
              hintText: User.fromJson(controllerImp.user['profile']).firstName!,
              label: "First Name",
              icon: Icons.person_outline,
            ),
            SizedBox(height: 40),
            TextFieldAuth(
              isSucre: false,
              isNumber: false,
              valid: (val) {
                return validInput(val!, 3, 20, "lastName");
              },
              myController: controller.lastName,
              hintText: User.fromJson(controllerImp.user['profile']).lastName!,
              label: "Last Name",
              icon: Icons.person_outline,
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => controller.showOption(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Personal Photo"),
                      SizedBox(height: 8),
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.grey[200],
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            "${AppLink.image}${User.fromJson(controllerImp.user['profile']).profilePhoto!}",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.showCalendarDialog(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        User.fromJson(controllerImp.user['profile']).birthday!,
                      ),
                      SizedBox(height: 8),
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.calendar_today, size: 25),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 130),
            ButtonAuth(
              text: "Update",
              onPressed: () {
                controller.updateProfile();
              },
            ),
          ],
        ),
      ),
    );
  }
}
