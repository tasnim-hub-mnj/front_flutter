import 'package:flutter/material.dart';

class IconsCard extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconsCard({super.key, required this.icon, required this.text});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade600),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
      ],
    );
  }
}
