import 'package:beyt/view/widget/Home/Owner/CategoriesButton.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selectedCategoryIndex = 0;
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryButton(
            icon: Icons.home,
            label: 'All Houses',
            isSelected: _selectedCategoryIndex == 0,
            onTap: () {
              setState(() {
                _selectedCategoryIndex = 0;
              });
            },
          ),
          const SizedBox(width: 12),
          CategoryButton(
            icon: Icons.business,
            label: 'Rented houses',
            isSelected: _selectedCategoryIndex == 1,
            onTap: () {
              setState(() {
                _selectedCategoryIndex = 1;
              });
            },
          ),
          const SizedBox(width: 12),
          CategoryButton(
            icon: Icons.apartment,
            label: 'Unrented homes',
            isSelected: _selectedCategoryIndex == 2,
            onTap: () {
              setState(() {
                _selectedCategoryIndex = 2;
              });
            },
          ),
        ],
      ),
    );
  }
}
