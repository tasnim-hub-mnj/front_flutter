import 'package:beyt/controller/auth/ResetPassword_Controller.dart';
import 'package:beyt/core/functions/ValidInput.dart';
import 'package:beyt/view/widget/auth/ButtonAuth.dart';
import 'package:beyt/view/widget/auth/TextFieldAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(
      ResetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Reset Password",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              SizedBox(height: 20),
              Text(
                "New Password",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Please Enter Your New Password",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
          
              SizedBox(height: 25),
              GetBuilder<ResetPasswordControllerImp>(
                builder: (controller) {
                  return TextFieldAuth(
                    isSucre: controller.isShowPassword,
                    isNumber: false,
                    valid:(val){
                      return validInput(val!, 7, 15, "password");
                    } ,
                    myController: controller.password,
                    hintText: "New Password",
                    label: "Password",
                    icon: Icons.lock_outlined,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                  );
                },
              ),
              SizedBox(height: 25),
              GetBuilder<ResetPasswordControllerImp>(
                builder: (controller) {
                  return TextFieldAuth(
                    isSucre: controller.isShowPassword,
                    isNumber: false,
                    valid:(val){
                      return validInput(val!, 7, 15, "password");
                    } ,
                    myController: controller.password,
                    hintText: "Confirm New Password",
                    label: "Confirm Password",
                    icon: Icons.lock_outlined,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                  );
                },
              ),
              SizedBox(height: 15),
          
              ButtonAuth(
                text: "save",
                onPressed: () {
                  controller.goToSuccess();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
