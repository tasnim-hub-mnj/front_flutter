import 'package:flutter/material.dart';

class NavigationBarHome extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const NavigationBarHome({
    super.key,
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
            color: Colors.grey.shade400,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                icon: Icons.search,
                index: 0,
                isActive: currentIndex == 0,
              ),
              NavItem(
                icon: Icons.favorite_border,
                index: 1,
                isActive: currentIndex == 1,
              ),
              NavItem(
                icon: Icons.notifications_outlined,
                index: 2,
                isActive: currentIndex == 2,
              ),
              NavItem(
                icon: Icons.message_outlined,
                index: 3,
                isActive: currentIndex == 3,
              ),
              NavItem(
                icon: Icons.person_outline,
                index: 4,
                isActive: currentIndex == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget NavItem({
    required IconData icon,
    required int index,
    required bool isActive,
  }) {
    final color = isActive ? Color(0xFFFF6B35) : Colors.grey.shade400;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(icon, color: color, size: 25)],
        ),
      ),
    );
  }
}
