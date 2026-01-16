import 'package:beyt/controller/Home/Owner/MyApartement_Controller.dart';
import 'package:beyt/data/model/Home/Owner/apartmentData.dart';
import 'package:beyt/linkapi.dart';
import 'package:beyt/view/widget/Home/Owner/CardSetting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingApartments extends StatelessWidget {
  const SettingApartments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Setting Apartment",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.grey,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 4),
            Expanded(
              child: GetBuilder<MyApartmentControllerImp>(
                builder: (controller) => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  itemCount: controller.apartment.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: CardSetting(
                        action: Apartment.fromJson(
                          controller.apartment[index],
                        ).action!,
                        image:
                            "${AppLink.image}${Apartment.fromJson(controller.apartment[index]).apartmentPhoto!}",
                        rating: Apartment.fromJson(
                          controller.apartment[index],
                        ).rating!,

                        location:
                            "${Apartment.fromJson(controller.apartment[index]).city!}/${Apartment.fromJson(controller.apartment[index]).area!}/${Apartment.fromJson(controller.apartment[index]).address!}",
                        size:
                            "${Apartment.fromJson(controller.apartment[index]).space!} M",
                        bedrooms: Apartment.fromJson(
                          controller.apartment[index],
                        ).room!,
                        bathrooms: Apartment.fromJson(
                          controller.apartment[index],
                        ).bathroom!,
                        price:
                            "\$${Apartment.fromJson(controller.apartment[index]).price!}",
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
