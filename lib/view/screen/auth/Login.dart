import 'package:beyt/controller/auth/Login_Controller.dart';
import 'package:beyt/core/functions/AlertExitApp.dart';
import 'package:beyt/core/functions/ValidInput.dart';
import 'package:beyt/view/widget/auth/ButtonAuth.dart';
import 'package:beyt/view/widget/auth/LogoAuth.dart';
import 'package:beyt/view/widget/auth/TextFieldAuth.dart';
import 'package:beyt/view/widget/auth/TextSignupAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text(
          "Sing In",
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
          padding: EdgeInsets.all(20),
          child: Form(
            key: controller.formState,
            child: ListView(
              children: [
                LogoAuth(),
                SizedBox(height: 15),
                Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Sing in with your phon number and password\n or continue with social media",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40),
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
                SizedBox(height: 35),
                GetBuilder<LoginControllerImp>(
                  builder: (controller) => TextFieldAuth(
                    isNumber: false,
                    isSucre: controller.isShowPassword  ,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
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
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      controller.goToForgetPassword();
                    },
                    child: Text("Forget Password", textAlign: TextAlign.end),
                  ),
                ),
                SizedBox(height: 15),
                ButtonAuth(
                  text: "Continue",
                  onPressed: () {
                    controller.Login();
                  },
                ),
                SizedBox(height: 25),
                TextSignupAuth(
                  textOne: "Don't have an account ? ",
                  textTow: "Sign Up",
                  onTap: () {
                    controller.goToSignup();
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
