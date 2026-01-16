import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/view/widget/Home/NotificationCard.dart';
import 'package:beyt/view/widget/Home/Owner/BottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Text(
              "Notification",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: // GetBuilder<MyApartmentControllerImp>(
                  //builder: (controller) =>
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                          bottom: 16,
                          top: 8,
                        ),
                        child: NotificationCard(
                          title: 'mohammed',
                          body:
                              'hiiiiiiiii',
                        ),
                      );
                    },
                  ),
              // ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: OwnerBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(AppRoutes.myApartments);
          } else if (index == 2) {
            Get.toNamed(AppRoutes.addApartment);
          } else if (index == 3) {
            //Get.toNamed(AppRoutes.message);
          } else if (index == 4) {
            Get.toNamed(AppRoutes.ownerProfile);
          } else {
            index = 1;
          }
        },
      ),
    );
  }
}
