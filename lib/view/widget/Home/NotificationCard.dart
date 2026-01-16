import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String body;
  final Widget? action;
  const NotificationCard({
    super.key,
    required this.title,
    required this.body,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 90,
        padding: EdgeInsets.all(16),
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

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 100, 100, 100),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  body,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 4),
                Icon(Icons.notifications, size: 30, color: Color(0xFFFF6B35)),
                InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: "Warning",
                      middleText: "delete this notification",
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            size: 40,
                            color: Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                      ],
                      radius: 10,
                    );
                  },
                  child: Icon(
                    Icons.more_horiz,
                    size: 24,
                    color: Color(0xFFFF6B35),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
