import 'package:flutter/material.dart';

class DropdownApartmentCity extends StatelessWidget {
  final String value;
  final Function(String?) onChanged;
  final String hint;
  const DropdownApartmentCity({
    super.key,
    required this.value,
    required this.onChanged,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        items:
            [
              'No City',
              'Damascus',
              'Damascus Countryside',
              'Aleppo',
              'Homs',
              'Hamah',
              'Latakia',
              'Tartous',
              'Daraa',
              'Der alzoor',
              'Idlib',
            ].map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: const TextStyle(color: Colors.black87, fontSize: 16),
                ),
              );
            }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

class DropdownApartmentArea extends StatelessWidget {
  final String value;
  final Function(String?) onChanged;
  final String hint;
  const DropdownApartmentArea({
    super.key,
    required this.value,
    required this.onChanged,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        items:
            [
              'No Area',
              'Damascus',
              'Damascus Countryside',
              'Aleppo',
              'Homs',
              'Hamah',
              'Latakia',
              'Tartous',
              'Daraa',
              'Der alzoor',
              'Idlib',
            ].map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: const TextStyle(color: Colors.black87, fontSize: 16),
                ),
              );
            }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
