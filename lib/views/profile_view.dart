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
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileNameContainer(),
                  SizedBox(height: 20),
                  EditProfileCard(),
                  SizedBox(height: 10),
                  ProgressCard(),
                  CustomerSupportCard(),
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.logout),
                              SizedBox(width: 10),
                              Text(
                                'تسجيل الخروج',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
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
          bottomNavigationBar: MainBottomNavigationBar(currentIndex: 4),
        ),
      ),
    );
  }
}
