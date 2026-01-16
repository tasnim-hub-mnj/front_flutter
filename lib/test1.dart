/////////////////////////الاساسي///////////////////////////

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Search',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PropertySearchScreen(),
    );
  }
}

class PropertySearchScreen extends StatefulWidget {
  const PropertySearchScreen({super.key});

  @override
  State<PropertySearchScreen> createState() => _PropertySearchScreenState();
}

class _PropertySearchScreenState extends State<PropertySearchScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 12.0),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    const Expanded(
                      child: Text(
                        '94025',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        icon: const Icon(Icons.close, size: 20, color: Colors.grey),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        icon: const Icon(Icons.tune, color: Colors.grey),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FiltersScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Results Count and Save Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '38 results',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Save search',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF4CAF50),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Property Listings
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: const [
                  PropertyCard(
                    address: '551 Newbridge St, Menlo Park, CA',
                    price: '\$365,254.00',
                    beds: 3,
                    baths: 2,
                    sqft: 1210,
                    timeAgo: '4 hours ago',
                    imageTag: null,
                  ),
                  SizedBox(height: 16),
                  PropertyCard(
                    address: '123 Main St, Menlo Park, CA',
                    price: '\$425,000.00',
                    beds: 4,
                    baths: 3,
                    sqft: 1850,
                    timeAgo: null,
                    imageTag: 'Private backyard',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 1) {
            // Navigate to Saved screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SavedScreen(),
              ),
            );
          } else if (index == 3) {
            // Navigate to Profile/Account screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountScreen(),
              ),
            );
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }
}

class _CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const _CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SafeArea(
        child: Container(
          height: 77,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.search,
                label: 'Search',
                index: 0,
                isActive: currentIndex == 0,
              ),
              _buildNavItem(
                icon: Icons.favorite_border,
                label: 'Saved',
                index: 1,
                isActive: currentIndex == 1,
              ),
              _buildNavItem(
                icon: Icons.receipt_long,
                label: 'Loans',
                index: 2,
                isActive: currentIndex == 2,
              ),
              _buildNavItem(
                icon: Icons.person_outline,
                label: 'Profile',
                index: 3,
                isActive: currentIndex == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isActive,
  }) {
    final color = isActive ? const Color(0xFF4CAF50) : Colors.grey.shade400;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String address;
  final String price;
  final int beds;
  final int baths;
  final int sqft;
  final String? timeAgo;
  final String? imageTag;

  const PropertyCard({
    super.key,
    required this.address,
    required this.price,
    required this.beds,
    required this.baths,
    required this.sqft,
    this.timeAgo,
    this.imageTag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PropertyDetailScreen(
              address: address,
              price: price,
              beds: beds,
              baths: baths,
              sqft: sqft,
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
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.shade50,
                      Colors.grey.shade300,
                    ],
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
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.home,
                            size: 80,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Time ago tag or image tag
              if (timeAgo != null || imageTag != null)
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      timeAgo ?? imageTag ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              // Heart icon
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 20,
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
              // Photo count icon
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.photo_library,
                    color: Colors.white,
                    size: 16,
                  ),
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
                // Address
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        address,
                        style: const TextStyle(
                          fontSize: 14,
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
                    _buildFeature(Icons.bed, '$beds bed'),
                    const SizedBox(width: 16),
                    _buildFeature(Icons.bathtub, '$baths Bath'),
                    const SizedBox(width: 16),
                    _buildFeature(Icons.square_foot, '$sqft Sqft'),
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

  Widget _buildFeature(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade600),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  String _selectedPropertyType = 'For Sale';
  String _selectedPriceToggle = 'Updates';
  RangeValues _priceRange = const RangeValues(145000, 300000);
  String _minBedrooms = 'No Max';
  String _maxBedrooms = 'No Max';

  String _formatPrice(double price) {
    return '\$${price.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }

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
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _selectedPropertyType = 'For Sale';
                _selectedPriceToggle = 'Updates';
                _priceRange = const RangeValues(145000, 300000);
                _minBedrooms = 'No Max';
                _maxBedrooms = 'No Max';
              });
            },
            child: const Text(
              'Reset',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
        ],
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
                    // Search Updates Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.grey),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'Get updates on your search',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4CAF50),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Save Search'),
                          ),
                        ],
                      ),
                    ),
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
                    Row(
                      children: [
                        Expanded(
                          child: _buildPropertyTypeButton('For Sale'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildPropertyTypeButton('For Rent'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildPropertyTypeButton('Recently Sold'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
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
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'New',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Toggle Buttons
                    Row(
                      children: [
                        Expanded(
                          child: _buildToggleButton('Updates'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildToggleButton('Saved Homes'),
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
                          activeColor: const Color(0xFF4CAF50),
                          inactiveColor: Colors.grey.shade300,
                          onChanged: (RangeValues values) {
                            setState(() {
                              _priceRange = values;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Calculate Budget Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calculate,
                                color: const Color(0xFF4CAF50),
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Calculate your Budget',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 36),
                            child: Text(
                              'Find out how much you can comfortably spend on a home.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
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
                          child: _buildBedroomDropdown(
                            value: _minBedrooms,
                            onChanged: (String? newValue) {
                              setState(() {
                                _minBedrooms = newValue ?? 'No Max';
                              });
                            },
                            hint: 'Min',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildBedroomDropdown(
                            value: _maxBedrooms,
                            onChanged: (String? newValue) {
                              setState(() {
                                _maxBedrooms = newValue ?? 'No Max';
                              });
                            },
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
                    _buildBedroomDropdown(
                      value: _maxBedrooms,
                      onChanged: (String? newValue) {
                        setState(() {
                          _maxBedrooms = newValue ?? 'No Max';
                        });
                      },
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
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4CAF50),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'See 43 Results',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyTypeButton(String type) {
    final isSelected = _selectedPropertyType == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPropertyType = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4CAF50) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? const Color(0xFF4CAF50) : Colors.grey.shade300,
          ),
        ),
        child: Text(
          type,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label) {
    final isSelected = _selectedPriceToggle == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPriceToggle = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4CAF50) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? const Color(0xFF4CAF50) : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildBedroomDropdown({
    required String value,
    required Function(String?) onChanged,
    required String hint,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        items: ['No Max', '1', '2', '3', '4', '5+'].map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(
              option,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

class PropertyDetailScreen extends StatelessWidget {
  final String address;
  final String price;
  final int beds;
  final int baths;
  final int sqft;

  const PropertyDetailScreen({
    super.key,
    required this.address,
    required this.price,
    required this.beds,
    required this.baths,
    required this.sqft,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Image Section
                    Stack(
                      children: [
                        Container(
                          height: 350,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.blue.shade50,
                                Colors.grey.shade300,
                              ],
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 280,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.home,
                                      size: 120,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Top Left - Close Button
                        Positioned(
                          top: 16,
                          left: 16,
                          child: _buildActionButton(
                            icon: Icons.close,
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                        // Top Right - Action Buttons
                        Positioned(
                          top: 16,
                          right: 16,
                          child: Row(
                            children: [
                              _buildActionButton(
                                icon: Icons.favorite_border,
                                onTap: () {},
                              ),
                              const SizedBox(width: 8),
                              _buildActionButton(
                                icon: Icons.download,
                                onTap: () {},
                              ),
                              const SizedBox(width: 8),
                              _buildActionButton(
                                icon: Icons.block,
                                onTap: () {},
                              ),
                              const SizedBox(width: 8),
                              _buildActionButton(
                                icon: Icons.more_vert,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Image Preview Row
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildImagePreview(
                              'Kitchen 1',
                              tag: 'House for sale',
                              tagColor: Colors.red,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildImagePreview('Kitchen 2'),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Stack(
                              children: [
                                _buildImagePreview('Kitchen 3', isGrayscale: true),
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        const SizedBox(height: 4),
                                        const Text(
                                          'View All 20',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Property Details Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Price and Price Cut
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  price,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    color: Color(0xFF4CAF50),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Colors.white,
                                      size: 8,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'Price cut: \$50k',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
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
                                size: 20,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  address,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Key Features
                          Row(
                            children: [
                              _buildFeaturePill(Icons.bed, '$beds bed'),
                              const SizedBox(width: 12),
                              _buildFeaturePill(Icons.bathtub, '$baths Bath'),
                              const SizedBox(width: 12),
                              _buildFeaturePill(Icons.square_foot, '$sqft Sqft'),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Estimated Monthly Payment
                          Row(
                            children: [
                              const Text(
                                'Est. US\$10,794/mo',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 6),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 18,
                                  height: 18,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.info,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Get pre-qualified',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Property Information Grid
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 2.2,
                            children: [
                              _buildInfoCard(
                                Icons.home,
                                'US\$1,646,900\nZestimate',
                                showZ: true,
                              ),
                              _buildInfoCard(
                                Icons.people,
                                'Single family\nresidence',
                              ),
                              _buildInfoCard(
                                Icons.square_foot,
                                'US\$1,028/sqft',
                              ),
                              _buildInfoCard(
                                Icons.business,
                                'Built in 1947',
                              ),
                              _buildInfoCard(
                                Icons.crop_square,
                                'S--HOB',
                              ),
                              _buildInfoCard(
                                Icons.map,
                                '5,750 sqft lot',
                              ),
                            ],
                          ),
                          const SizedBox(height: 100), // Space for bottom buttons
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Action Buttons
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
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Contact',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4CAF50),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Request',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
            ),
          ],
        ),
        child: Icon(icon, color: Colors.black87, size: 20),
      ),
    );
  }

  Widget _buildImagePreview(
    String label, {
    String? tag,
    Color? tagColor,
    bool isGrayscale = false,
  }) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: isGrayscale ? Colors.grey.shade300 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(
              Icons.home,
              size: 40,
              color: Colors.grey.shade600,
            ),
          ),
          if (tag != null)
            Positioned(
              bottom: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: tagColor ?? Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFeaturePill(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.black87),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String text, {bool showZ = false}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: Colors.grey.shade700),
              if (showZ) ...[
                const SizedBox(width: 4),
                const Text(
                  'Z',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  String _selectedTab = 'Updates';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Section with Profile and Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Profile Picture
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.shade100,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.blue.shade700,
                      size: 24,
                    ),
                  ),
                  const Spacer(),
                  // Title
                  const Text(
                    'Saved',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(),
                  // Spacer to center title
                  const SizedBox(width: 40),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Tab Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildTabButton('Updates', _selectedTab == 'Updates'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTabButton('Saved Homes', _selectedTab == 'Saved Homes'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Saved searches section
                    const Text(
                      'Saved searches',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildSavedSearchItem(
                      title: 'For Sale near 94025',
                      criteria: 'For sale, \$220K-\$5.5M, 1+ Beds',
                      badgeCount: 7,
                    ),
                    const SizedBox(height: 24),
                    // Property Listings (Horizontal Scroll)
                    SizedBox(
                      height: 320,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildHorizontalPropertyCard(
                            address: '139 Oak ct, Menlo Park, CA',
                            price: '\$ 541,254.00',
                            beds: 3,
                            baths: 2,
                            kitchens: 3,
                            sqft: 1210,
                            hasNewListing: true,
                          ),
                          const SizedBox(width: 16),
                          _buildHorizontalPropertyCard(
                            address: '9402 Main St, Menlo Park, CA',
                            price: '\$ 658,900.00',
                            beds: 3,
                            baths: 2,
                            kitchens: 2,
                            sqft: 1450,
                            hasNewListing: true,
                          ),
                          const SizedBox(width: 16),
                          _buildHorizontalPropertyCard(
                            address: '123 Park Ave, Menlo Park, CA',
                            price: '\$ 725,000.00',
                            beds: 4,
                            baths: 3,
                            kitchens: 2,
                            sqft: 1800,
                            hasNewListing: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Watching Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Watching',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'For Sale, \$1.5K - \$15K/month, House, Townhome, Multi-family, Manufactured, Lot, Yard',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // More Property Listings (Horizontal Scroll)
                    SizedBox(
                      height: 320,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildHorizontalPropertyCard(
                            address: '456 Elm St, Menlo Park, CA',
                            price: '\$ 895,000.00',
                            beds: 4,
                            baths: 3,
                            kitchens: 2,
                            sqft: 2100,
                            hasNewListing: false,
                            hasVideoWalkthrough: true,
                          ),
                          const SizedBox(width: 16),
                          _buildHorizontalPropertyCard(
                            address: '789 Pine Rd, Menlo Park, CA',
                            price: '\$ 1,125,000.00',
                            beds: 5,
                            baths: 4,
                            kitchens: 3,
                            sqft: 2800,
                            hasNewListing: false,
                            daysOnMarket: 99,
                          ),
                          const SizedBox(width: 16),
                          _buildHorizontalPropertyCard(
                            address: '321 Maple Dr, Menlo Park, CA',
                            price: '\$ 750,000.00',
                            beds: 3,
                            baths: 2,
                            kitchens: 2,
                            sqft: 1600,
                            hasNewListing: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _CustomBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountScreen(),
              ),
            );
          } else {
            // Handle other navigation
          }
        },
      ),
    );
  }

  Widget _buildTabButton(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4CAF50) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade700,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildSavedSearchItem({
    required String title,
    required String criteria,
    required int badgeCount,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.chevron_right,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    criteria,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$badgeCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalPropertyCard({
    required String address,
    required String price,
    required int beds,
    required int baths,
    required int kitchens,
    required int sqft,
    bool hasNewListing = false,
    bool hasVideoWalkthrough = false,
    int? daysOnMarket,
  }) {
    return Container(
      width: 280,
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
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.shade50,
                      Colors.grey.shade300,
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.home,
                            size: 60,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Tags
              if (hasNewListing)
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'New Listing',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              if (hasVideoWalkthrough)
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Video Walkthrough',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (daysOnMarket != null)
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$daysOnMarket days',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              // Heart icon
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
              ),
              // Share icon
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 16,
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
                  children: List.generate(5, (index) {
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
                // Address
                Text(
                  address,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                // Price
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF4CAF50),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                // Property features
                Row(
                  children: [
                    _buildFeatureChip('$beds bed'),
                    const SizedBox(width: 8),
                    _buildFeatureChip('$baths Bath'),
                    const SizedBox(width: 8),
                    _buildFeatureChip('$kitchens Kit'),
                    const SizedBox(width: 8),
                    _buildFeatureChip('$sqft Sqft'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureChip(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey.shade700,
      ),
    );
  }
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Zillow account',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Account Information Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  // Profile Picture
                  Stack(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.shade100,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.blue.shade700,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  // Name and Email
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Cameron Williamson',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'example.edger@gmail.com',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.camera_alt,
                              size: 18,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ),
                      ],
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
                  _buildAccountOption(
                    icon: Icons.notifications_outlined,
                    label: 'Notifications',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  _buildAccountOption(
                    icon: Icons.description_outlined,
                    label: 'Renter profile',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  _buildAccountOption(
                    icon: Icons.visibility_off_outlined,
                    label: 'Hidden homes',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  _buildAccountOption(
                    icon: Icons.settings_outlined,
                    label: 'App settings',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  _buildAccountOption(
                    icon: Icons.help_outline,
                    label: 'Help & feedback',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  _buildAccountOption(
                    icon: Icons.lock_outline,
                    label: 'Privacy portal',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  _buildAccountOption(
                    icon: Icons.description_outlined,
                    label: 'Renter profile',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey.shade700,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey.shade400,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}



////////////////////////////الثانوي//////////////////////////////

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Property App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFFFF6B35), // Orange color
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color(0xFFFF6B35),
//           primary: const Color(0xFFFF6B35),
//         ),
//         useMaterial3: true,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Top status bar (simulated)
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     '9:41',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Stack(
//                         children: [
//                           const Icon(Icons.notifications_outlined, size: 20),
//                           Positioned(
//                             right: 0,
//                             top: 0,
//                             child: Container(
//                               width: 8,
//                               height: 8,
//                               decoration: const BoxDecoration(
//                                 color: Color(0xFFFF6B35),
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(width: 8),
//                       const Icon(Icons.signal_cellular_4_bar, size: 16),
//                       const SizedBox(width: 4),
//                       const Icon(Icons.wifi, size: 16),
//                       const SizedBox(width: 4),
//                       const Icon(Icons.battery_full, size: 16),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             // Main content
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Header with menu and Categories title
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.menu),
//                                 onPressed: () {},
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 8),
//                           const Text(
//                             'Categories',
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           // Category buttons
//                           SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Row(
//                               children: [
//                                 CategoryButton(
//                                   icon: Icons.home,
//                                   label: 'House',
//                                   isSelected: true,
//                                   onTap: () {},
//                                 ),
//                                 const SizedBox(width: 12),
//                                 CategoryButton(
//                                   icon: Icons.business,
//                                   label: 'Condos',
//                                   isSelected: false,
//                                   onTap: () {},
//                                 ),
//                                 const SizedBox(width: 12),
//                                 CategoryButton(
//                                   icon: Icons.apartment,
//                                   label: 'Apartment',
//                                   isSelected: false,
//                                   onTap: () {},
//                                 ),
//                                 const SizedBox(width: 12),
//                                 CategoryButton(
//                                   icon: Icons.home_work,
//                                   label: 'Townhouses',
//                                   isSelected: false,
//                                   onTap: () {},
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Newly Added section
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Newly Added',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {},
//                             child: const Text(
//                               'See All',
//                               style: TextStyle(
//                                 color: Color(0xFFFF6B35),
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     SizedBox(
//                       height: 280,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         itemCount: 5,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.only(right: 16),
//                             child: PropertyCard(
//                               title: 'Summer House',
//                               rating: 4.5,
//                               location: 'California, USA',
//                               size: '100 M',
//                               bedrooms: 1,
//                               bathrooms: 2,
//                               price: '\$400',
//                               imageColor: Colors.blue.shade100,
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     // Best Offers section
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Best Offers',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {},
//                             child: const Text(
//                               'See All',
//                               style: TextStyle(
//                                 color: Color(0xFFFF6B35),
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     SizedBox(
//                       height: 280,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         itemCount: 5,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.only(right: 16),
//                             child: PropertyCard(
//                               title: 'Summer House',
//                               rating: 4.5,
//                               location: 'California, USA',
//                               size: '100 M',
//                               bedrooms: 1,
//                               bathrooms: 2,
//                               price: null,
//                               imageColor: Colors.green.shade100,
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     const SizedBox(height: 80), // Space for bottom nav
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 1,
//               blurRadius: 5,
//               offset: const Offset(0, -3),
//             ),
//           ],
//         ),
//         child: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           onTap: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//           type: BottomNavigationBarType.fixed,
//           selectedItemColor: const Color(0xFFFF6B35),
//           unselectedItemColor: Colors.grey,
//           backgroundColor: Colors.white,
//           elevation: 0,
//           items: [
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.search),
//               label: 'Search',
//             ),
//             BottomNavigationBarItem(
//               icon: Container(
//                 width: 50,
//                 height: 50,
//                 decoration: const BoxDecoration(
//                   color: Color(0xFFFF6B35),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.add,
//                   color: Colors.white,
//                   size: 28,
//                 ),
//               ),
//               label: '',
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.message_outlined),
//               label: 'Messages',
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.person_outline),
//               label: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CategoryButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const CategoryButton({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         decoration: BoxDecoration(
//           color: isSelected ? const Color(0xFFFF6B35) : Colors.grey.shade100,
//           borderRadius: BorderRadius.circular(25),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               icon,
//               color: isSelected ? Colors.white : Colors.grey.shade700,
//               size: 20,
//             ),
//             const SizedBox(width: 8),
//             Text(
//               label,
//               style: TextStyle(
//                 color: isSelected ? Colors.white : Colors.grey.shade700,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PropertyCard extends StatelessWidget {
//   final String title;
//   final double rating;
//   final String location;
//   final String size;
//   final int bedrooms;
//   final int bathrooms;
//   final String? price;
//   final Color imageColor;

//   const PropertyCard({
//     super.key,
//     required this.title,
//     required this.rating,
//     required this.location,
//     required this.size,
//     required this.bedrooms,
//     required this.bathrooms,
//     this.price,
//     required this.imageColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 240,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Image section
//           Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 160,
//                 decoration: BoxDecoration(
//                   color: imageColor,
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     topRight: Radius.circular(16),
//                   ),
//                 ),
//                 child: Center(
//                   child: Icon(
//                     Icons.home,
//                     size: 60,
//                     color: Colors.grey.shade400,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 12,
//                 right: 12,
//                 child: Container(
//                   padding: const EdgeInsets.all(6),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(
//                     Icons.favorite_border,
//                     size: 18,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // Content section
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         title,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.star,
//                           size: 16,
//                           color: Colors.amber,
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           rating.toString(),
//                           style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     const Icon(
//                       Icons.location_on,
//                       size: 14,
//                       color: Colors.grey,
//                     ),
//                     const SizedBox(width: 4),
//                     Expanded(
//                       child: Text(
//                         location,
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey.shade600,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     _buildPropertyDetail(Icons.home, size),
//                     const SizedBox(width: 12),
//                     _buildPropertyDetail(Icons.bed, bedrooms.toString()),
//                     const SizedBox(width: 12),
//                     _buildPropertyDetail(Icons.bathtub, bathrooms.toString()),
//                     if (price != null) const Spacer(),
//                     if (price != null)
//                       Text(
//                         price!,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFFFF6B35),
//                         ),
//                       ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPropertyDetail(IconData icon, String value) {
//     return Row(
//       children: [
//         Icon(icon, size: 14, color: Colors.grey.shade600),
//         const SizedBox(width: 4),
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 12,
//             color: Colors.grey.shade600,
//           ),
//         ),
//       ],
//     );
//   }
// }
