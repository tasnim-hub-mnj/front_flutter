import 'package:beyt/controller/auth/ForgetPassword_Controller.dart';
import 'package:beyt/core/functions/ValidInput.dart';
import 'package:beyt/view/widget/auth/ButtonAuth.dart';
import 'package:beyt/view/widget/auth/TextFieldAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller = Get.put(
      ForgetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forget Password",
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
                "Check Phone Number",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Please enter your phone number to reset your verification code",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              TextFieldAuth(
                isSucre: false,
                isNumber: true,
                valid: (val) {
                  return validInput(val!, 10, 15, "phone");
                },
                myController: controller.phon,
                hintText: "Enter Your Phon Number,",
                label: "Phon",
                icon: Icons.phone_android_outlined,
              ),
              SizedBox(height: 15),
              ButtonAuth(
                text: "Check",
                onPressed: () {
                  controller.goToVerifyCode();
                },
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
