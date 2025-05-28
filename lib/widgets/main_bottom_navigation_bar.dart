import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tawasel/Models/auth_models/auth_api_success_response_model.dart';
import 'package:tawasel/helper/constants.dart';
import '../helper/app_router.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: currentIndex,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        switch (index) {
          case 0:
            GoRouter.of(context).push(AppRouter.kLearningContentScreen);
            break;
         
          case 1:
            GoRouter.of(context).push(AppRouter.kHomeView);
            break;
          case 2:
            GoRouter.of(context).push(AppRouter.kProfileView);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.description, size: 32),
          label: "المحتوى التعليمي",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 32),
          label: "الصفحة الرئيسية",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 32),
          label: "الملف الشخصي",
        ),
        
      ],
    );
  }
}
