import 'package:flutter/material.dart';

class OwnerBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const OwnerBottomNavigationBar({
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
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(
                icon: Icon(
                  currentIndex == 0 ? Icons.home : Icons.home_outlined,
                  size: 32,
                  color: currentIndex == 0
                      ? Color(0xFFFF6B35)
                      : Colors.grey.shade400,
                ),
                index: 0,
                isActive: currentIndex == 0,
              ),
              navItem(
                icon: Icon(
                  currentIndex == 1
                      ? Icons.notifications
                      : Icons.notifications_outlined,
                  size: 32,
                  color: currentIndex == 1
                      ? Color(0xFFFF6B35)
                      : Colors.grey.shade400,
                ),
                index: 1,
                isActive: currentIndex == 1,
              ),
              navItem(
                icon: Transform.translate(
                  offset: const Offset(0, -20),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF6B35),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF6B35).withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 28),
                  ),
                ),
                index: 2,
                isActive: currentIndex == 2,
              ),
              navItem(
                icon: Icon(
                  currentIndex == 3 ? Icons.message : Icons.message_outlined,
                  size: 32,
                  color: currentIndex == 3
                      ? Color(0xFFFF6B35)
                      : Colors.grey.shade400,
                ),
                index: 3,
                isActive: currentIndex == 3,
              ),
              navItem(
                icon: Icon(
                  currentIndex == 4 ? Icons.person : Icons.person_outline,
                  size: 32,
                  color: currentIndex == 4
                      ? Color(0xFFFF6B35)
                      : Colors.grey.shade400,
                ),
                index: 4,
                isActive: currentIndex == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem({
    required Widget icon,
    required int index,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(mainAxisSize: MainAxisSize.min, children: [icon]),
    );
  }
}
