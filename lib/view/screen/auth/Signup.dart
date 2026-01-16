import 'package:beyt/controller/auth/SignUp_Controller.dart';
import 'package:beyt/core/functions/AlertExitApp.dart';
import 'package:beyt/core/functions/ValidInput.dart';
import 'package:beyt/view/widget/auth/ButtonAuth.dart';
import 'package:beyt/view/widget/auth/DropDownSignup.dart';
import 'package:beyt/view/widget/auth/TextFieldAuth.dart';
import 'package:beyt/view/widget/auth/TextSignupAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    SignupControllerImp controller = Get.put(SignupControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.grey,
          ),
        ),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Form(
            key: controller.formState,
            child: ListView(
              children: [
                SizedBox(height: 10),
                TextFieldAuth(
                  isSucre: false,
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 3, 20, "firstName");
                  },
                  myController: controller.firstName,
                  hintText: "Enter Your First Name",
                  label: "First Name",
                  icon: Icons.person_outline,
                ),
                SizedBox(height: 20),
                TextFieldAuth(
                  isSucre: false,
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 3, 20, "lastName");
                  },
                  myController: controller.lastName,
                  hintText: "Enter Your Last Name,",
                  label: "Last Name",
                  icon: Icons.person_outline,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => controller.showOption(context, true),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Personal Photo"),
                          SizedBox(height: 8),
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.grey[200],
                            child: Icon(Icons.add_a_photo_outlined, size: 25),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.showCalendarDialog(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Birth Day"),
                          SizedBox(height: 8),
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.grey[200],
                            child: Icon(Icons.calendar_today, size: 25),
                          ),
                        ],
                      ),
                    ),
                    // ID photo picker (was incorrectly passing a File to TextFieldAuth)
                    GestureDetector(
                      onTap: () => controller.showOption(context, false),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("ID Photo"),
                          SizedBox(height: 8),
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.grey[200],
                            child: Icon(
                              Icons.card_membership_outlined,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                TextFieldAuth(
                  isSucre: false,
                  isNumber: true,
                  valid: (val) {
                    return validInput(val!, 10, 15, "phone");
                  },
                  myController: controller.phon,
                  hintText: "Enter Your Phon Number",
                  label: "Phon",
                  icon: Icons.phone_android_outlined,
                ),
                SizedBox(height: 20),
                GetBuilder<SignupControllerImp>(
                  builder: (controller) => TextFieldAuth(
                    isSucre: controller.isShowPassword,
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 7, 15, "password");
                    },
                    myController: controller.password,
                    hintText: "Enter Your Password",
                    label: "Password",
                    icon: Icons.lock_outlined,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                  ),
                ),
                SizedBox(height: 15),
                GetBuilder<SignupControllerImp>(
                  builder: (controller) => DropdownSignup(
                    value: controller.yourRole,
                    onChanged: (val) {
                      controller.showRole(val!);
                      controller.role.text = val;
                    },
                    hint: 'Max',
                  ),
                ),
                SizedBox(height: 15),
                ButtonAuth(
                  text: "Sign Up",
                  onPressed: () {
                    controller.Signup();
                  },
                ),
                SizedBox(height: 25),
                TextSignupAuth(
                  textOne: " Have an account ? ",
                  textTow: "Sign In",
                  onTap: () {
                    controller.GoToSignin();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
