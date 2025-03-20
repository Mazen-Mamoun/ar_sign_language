import 'package:flutter/material.dart';
import 'package:tawasel/widgets/profile_progress_card.dart';
import 'package:tawasel/widgets/customer_support_card.dart';
import 'package:tawasel/widgets/edit_profile_card.dart';
import 'package:tawasel/widgets/main_bottom_navigation_bar.dart';
import 'package:tawasel/widgets/profile_name_container.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProfileNameContainer(),
                  const SizedBox(height: 20),
                  const EditProfileCard(),
                  const SizedBox(height: 10),
                  const ProgressCard(),
                  const CustomerSupportCard(),
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.red[800],
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'تسجيل الخروج',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[800],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: MainBottomNavigationBar(currentIndex: 4),
      ),
    );
  }
}
