import 'package:beyt/controller/Home/Owner/MyApartement_Controller.dart';
import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/data/model/Home/Owner/apartmentData.dart';
import 'package:beyt/linkapi.dart';
import 'package:beyt/view/widget/Home/Owner/BottomNavigationBar.dart';
import 'package:beyt/view/widget/Home/Owner/CardOwner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApartments extends StatelessWidget {
  const MyApartments({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyApartmentControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Main content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_home,
                            color: Color(0xFFFF6B35),
                            size: 34,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Text(
                              'All Houses',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Newly Added section
                    const SizedBox(height: 12),
                    GetBuilder<MyApartmentControllerImp>(
                      builder: (controller) => SizedBox(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: controller.apartment.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: ApartmentCard(
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
                    const SizedBox(height: 24),
                    // Best Offers section
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.home_work,
                            color: Color(0xFFFF6B35),
                            size: 34,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Text(
                              'Rented houses',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    GetBuilder<MyApartmentControllerImp>(
                      builder: (controller) => SizedBox(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: controller.rentedApartment.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: ApartmentCard(
                                image:
                                    "${AppLink.image}${Apartment.fromJson(controller.rentedApartment[index]).apartmentPhoto!}",
                                rating: Apartment.fromJson(
                                  controller.rentedApartment[index],
                                ).rating!,

                                location:
                                    "${Apartment.fromJson(controller.rentedApartment[index]).city!}/${Apartment.fromJson(controller.rentedApartment[index]).area!}/${Apartment.fromJson(controller.rentedApartment[index]).address!}",
                                size:
                                    "${Apartment.fromJson(controller.rentedApartment[index]).space!} M",
                                bedrooms: Apartment.fromJson(
                                  controller.rentedApartment[index],
                                ).room!,
                                bathrooms: Apartment.fromJson(
                                  controller.rentedApartment[index],
                                ).bathroom!,
                                price:
                                    "\$${Apartment.fromJson(controller.rentedApartment[index]).price!}",
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Best Offers section
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.other_houses,
                            color: Color(0xFFFF6B35),
                            size: 34,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Text(
                              'UnRented homes',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    GetBuilder<MyApartmentControllerImp>(
                      builder: (controller) => SizedBox(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: controller.unRentedApartment.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: ApartmentCard(
                                image:
                                    "${AppLink.image}${Apartment.fromJson(controller.unRentedApartment[index]).apartmentPhoto!}",
                                rating: Apartment.fromJson(
                                  controller.unRentedApartment[index],
                                ).rating!,

                                location:
                                    "${Apartment.fromJson(controller.unRentedApartment[index]).city!}/${Apartment.fromJson(controller.unRentedApartment[index]).area!}/${Apartment.fromJson(controller.unRentedApartment[index]).address!}",
                                size:
                                    "${Apartment.fromJson(controller.unRentedApartment[index]).space!} M",
                                bedrooms: Apartment.fromJson(
                                  controller.unRentedApartment[index],
                                ).room!,
                                bathrooms: Apartment.fromJson(
                                  controller.unRentedApartment[index],
                                ).bathroom!,
                                price:
                                    "\$${Apartment.fromJson(controller.unRentedApartment[index]).price!}",
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Space for bottom nav
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: OwnerBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Get.offNamed(AppRoutes.notifications);
          } else if (index == 2) {
            Get.toNamed(AppRoutes.addApartment);
          } else if (index == 3) {
            //Get.toNamed(AppRoutes.message);
          } else if (index == 4) {
            Get.offNamed(AppRoutes.ownerProfile);
          } else {
            index = 0;
          }
        },
      ),
    );
  }
}
