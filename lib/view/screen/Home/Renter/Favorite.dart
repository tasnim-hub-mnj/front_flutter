import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/view/widget/Home/Renter/FavoriteCard.dart';
import 'package:beyt/view/widget/Home/Renter/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Main content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Newly Added section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Newly Added',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                color: Color(0xFFFF6B35),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: PropertyCard(
                              title: 'Summer House',
                              rating: 4.5,
                              location: 'California, USA',
                              size: '100 M',
                              bedrooms: 1,
                              bathrooms: 2,
                              price: '\$400',
                              imageColor: Colors.blue.shade100,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBarHome(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(AppRoutes.search);
          } else if (index == 2) {
            Get.toNamed(AppRoutes.notification);
          } else if (index == 3) {
            Get.toNamed(AppRoutes.message);
          } else if (index == 4) {
            Get.toNamed(AppRoutes.renterProfile);
          } else {
            index = 1;
          }
        },
      ),
    );
  }
}
