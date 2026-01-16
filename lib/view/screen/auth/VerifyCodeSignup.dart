import 'package:beyt/controller/auth/VerifyCodeSignUp_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp controller = Get.put(
      VerifyCodeSignUpControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Verification Code",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Text(
              "Check Code",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "please Enter The Digit code Sent to ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 20),
            OtpTextField(
              numberOfFields: 5,
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              borderColor: const Color.fromARGB(255, 236, 107, 71),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
              },
              onSubmit: (String verificationCode) {
                controller.verifyCodeOnSubmit = verificationCode;
                controller.checkCode();
              },
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
