import 'package:beyt/view/widget/Home/Renter/Icons.dart';
import 'package:flutter/material.dart';

class CardSetting extends StatelessWidget {
  final int rating;
  final String location;
  final String size;
  final String bedrooms;
  final String bathrooms;
  final String? price;
  final String image;
  final Widget action;
  const CardSetting({
    super.key,
    required this.rating,
    required this.location,
    required this.size,
    required this.bedrooms,
    required this.bathrooms,
    this.price,
    required this.image,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => CardSetting(
      //         name: name,
      //         address: address,
      //         price: price,
      //         beds: beds,
      //         baths: baths,
      //         sq: sq,
      //         rating: rating,
      //         active: active,
      //       ),
      //     ),
      //   );
      // },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Simulated house structure
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 240,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: Image.network(image, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Details Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 13,
                          ),
                          const SizedBox(width: 4),

                          Text(
                            location,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 120),
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            rating.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Price
                  Text(
                    price!,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF4CAF50),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Property features
                  Row(
                    children: [
                      IconsCard(icon: Icons.bed, text: '$bedrooms bed'),
                      const SizedBox(width: 16),
                      IconsCard(icon: Icons.bathtub, text: '$bathrooms Bath'),
                      const SizedBox(width: 16),
                      IconsCard(icon: Icons.square_foot, text: '$size Sq'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  action,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
