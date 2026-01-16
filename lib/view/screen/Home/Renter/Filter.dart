import 'package:beyt/view/widget/Home/Renter/ButtonSearch.dart';
import 'package:beyt/view/widget/Home/Renter/Dropdown.dart';
import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  final RangeValues _priceRange = const RangeValues(145000, 300000);
  String _formatPrice(double price) {
    return '\$${price.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }

  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Filters',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    // Property Type Section
                    const Text(
                      'Property Type',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Price Range Section
                    Row(
                      children: [
                        const Text(
                          'Price Range',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Price Range Slider
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _formatPrice(_priceRange.start),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              _formatPrice(_priceRange.end),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        RangeSlider(
                          values: _priceRange,
                          min: 0,
                          max: 1000000,
                          divisions: 100,
                          activeColor: Color(0xFFFF6B35),
                          inactiveColor: Colors.grey.shade300,
                          onChanged: (RangeValues values) {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Bedrooms Section
                    const Text(
                      'Bedrooms',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Dropdown(
                            value: 'No Max',
                            onChanged: (String? newValue) {},
                            hint: 'Min',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Dropdown(
                            value: 'No Max',
                            onChanged: (String? newValue) {},
                            hint: 'Max',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Second Bedrooms Section (if needed)
                    const Text(
                      'Bedrooms',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Dropdown(
                      value: 'No Max',
                      onChanged: (String? newValue) {},
                      hint: 'No Max',
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Action Button
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SizedBox(width: double.infinity, child: ButtonSearch()),
            ),
          ],
        ),
      ),
    );
  }
}
