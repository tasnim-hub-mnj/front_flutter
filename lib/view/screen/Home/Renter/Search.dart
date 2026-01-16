import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/view/widget/Home/Renter/AppBarSearch.dart';
import 'package:beyt/view/widget/Home/Renter/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:beyt/view/widget/Home/Renter/Card.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            AppBarSearch(),
            const SizedBox(height: 4),
            // Property Listings
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  CardSearch(
                    active: true,
                    name: 'Modern Family Home',
                    address: '551 Newbridge St, Menlo Park, CA',
                    price: '\$365,254.00',
                    beds: 3,
                    baths: 2,
                    sq: 1210,
                    rating: 4.0,
                    timeAgo: '4 hours ago',
                  ),
                  const SizedBox(height: 16),
                  CardSearch(
                    active: false,
                    name: 'Modern Family Home',
                    address: '123 Main St, Menlo Park, CA',
                    price: '\$425,000.00',
                    beds: 4,
                    baths: 3,
                    sq: 1850,
                    rating: 4.5,
                    timeAgo: '4 hours ago',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBarHome(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Get.toNamed(AppRoutes.favorite);
          } else if (index == 2) {
            Get.toNamed(AppRoutes.notification);
          } else if (index == 3) {
            Get.toNamed(AppRoutes.message);
          } else if (index == 4) {
            Get.toNamed(AppRoutes.renterProfile);
          } else {
            index = 0;
          }
        },
      ),
    );
  }
}
