import 'package:beyt/view/screen/Home/Renter/Filter.dart';
import 'package:flutter/material.dart';

class AppBarSearch extends StatelessWidget {
  const AppBarSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12),
          child: Image.asset('assets/images/logo.png', height: 32),
        ),
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: IconButton(
            icon: const Icon(Icons.tune, color: Color(0xFFFF6B35), size: 25),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Filter()),
              );
            },
          ),
        ),
      ],
    );
  }
}
