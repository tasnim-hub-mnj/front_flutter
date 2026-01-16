import 'package:beyt/controller/Home/Owner/Profile_Controller.dart';
import 'package:beyt/controller/auth/Login_Controller.dart';
import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/data/model/Home/user.dart';
import 'package:beyt/linkapi.dart';
import 'package:beyt/view/widget/Home/Owner/BottomNavigationBar.dart';
import 'package:beyt/view/widget/Home/Renter/AccountOption.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerProfileScreen extends StatelessWidget {
  const OwnerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    ProfileControllerImp controllerImp = Get.put(ProfileControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 380,
              margin: EdgeInsets.only(top: 36, bottom: 16),
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFFF6B35)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.shade100,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        "${AppLink.image}${User.fromJson(controller.user['profile']).profilePhoto!}",
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "${User.fromJson(controller.user['profile']).firstName!} ${User.fromJson(controller.user['profile']).lastName!}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            // Account Options List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  AccountOption(
                    icon: Icons.mode_edit_outline,
                    label: 'Profile Setting',
                    onTap: () {
                      Get.toNamed(AppRoutes.ownerProfileUpdate);
                    },
                  ),
                  const SizedBox(height: 8),
                  AccountOption(
                    icon: Icons.home_outlined,
                    label: 'Apartments Setting',
                    onTap: () {
                      Get.toNamed(AppRoutes.settingApartment);
                    },
                  ),
                  const SizedBox(height: 8),
                  AccountOption(
                    icon: Icons.visibility_off_outlined,
                    label: 'Hidden homes',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  AccountOption(
                    icon: Icons.settings_outlined,
                    label: 'App settings',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  AccountOption(
                    icon: Icons.logout_outlined,
                    label: 'Log Out',
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Sure Massage',
                        middleText: 'Are you sure you want to delete user?',
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              controllerImp.logOut();
                              Get.back();
                            },
                            child: Text("Confirm"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("cancel"),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: OwnerBottomNavigationBar(
        currentIndex: 4,
        onTap: (index) {
          if (index == 0) {
            Get.offNamed(AppRoutes.myApartments);
          } else if (index == 1) {
            Get.offNamed(AppRoutes.notifications);
          } else if (index == 2) {
            Get.toNamed(AppRoutes.addApartment);
          } else if (index == 3) {
            //Get.toNamed(AppRoutes.message);
          } else {
            index = 4;
          }
        },
      ),
    );
  }
}
