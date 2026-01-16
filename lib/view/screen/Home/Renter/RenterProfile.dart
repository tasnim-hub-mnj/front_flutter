import 'package:beyt/view/widget/Home/Renter/AccountOption.dart';
import 'package:flutter/material.dart';

class RenterProfileScreen extends StatelessWidget {
  const RenterProfileScreen({super.key});

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
                  AccountOption(
                    icon: Icons.notifications_outlined,
                    label: 'Notifications',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  AccountOption(
                    icon: Icons.description_outlined,
                    label: 'Renter profile',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  AccountOption(
                    icon: Icons.visibility_off_outlined,
                    label: 'Hidden homes',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  AccountOption(
                    icon: Icons.settings_outlined,
                    label: 'App settings',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  AccountOption(
                    icon: Icons.help_outline,
                    label: 'Help & feedback',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  AccountOption(
                    icon: Icons.lock_outline,
                    label: 'Privacy portal',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  AccountOption(
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
}
