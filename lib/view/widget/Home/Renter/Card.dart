import 'package:beyt/core/constant/imageassets.dart';
import 'package:beyt/view/widget/Home/Renter/Icons.dart';
import 'package:flutter/material.dart';

class CardSearch extends StatelessWidget {
  final String name;
  final String address;
  final String price;
  final int beds;
  final int baths;
  final int sq;
  final double rating;
  final String? timeAgo;
  final bool active;
  const CardSearch({
    super.key,
    required this.address,
    required this.price,
    required this.beds,
    required this.baths,
    required this.sq,
    this.timeAgo,
    required this.name,
    required this.rating,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardSearch(
              name: name,
              address: address,
              price: price,
              beds: beds,
              baths: baths,
              sq: sq,
              rating: rating,
              active: active,
            ),
          ),
        );
      },
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
                          child: Center(
                            child: Image.asset(
                              ImageAssets.apartment1,
                              height: 240,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Time ago tag or image tag
                if (timeAgo != null)
                  // Heart icon
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      // padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(
                          active ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                          size: 25,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                // Carousel indicators
                Positioned(
                  bottom: 12,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == 0 ? Colors.white : Colors.white54,
                        ),
                      );
                    }),
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
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xFFFF6B35),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
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
                  const SizedBox(height: 12),
                  // Address
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 13,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          address,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Price
                  Text(
                    price,
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
                      IconsCard(icon: Icons.bed, text: '$beds bed'),
                      const SizedBox(width: 16),
                      IconsCard(icon: Icons.bathtub, text: '$baths Bath'),
                      const SizedBox(width: 16),
                      IconsCard(icon: Icons.square_foot, text: '$sq Sq'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
