import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/view/widget/auth/ButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(Icons.check_circle, color: Colors.green, size: 200),
            ),
            SizedBox(height: 20),
            Text(
              "Sign Up Successful!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Thank you for joining us!",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: ButtonAuth(
                text: "Go To Login",
                onPressed: () {
                  Get.offNamed(AppRoutes.login);
                },
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
