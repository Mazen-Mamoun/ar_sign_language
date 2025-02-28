import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_app/Widgets/home_app_bar.dart';
import 'package:sign_app/Widgets/home_category_buttons.dart';
import 'package:sign_app/helper/app_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final String userName = 'Ziad';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            HomeAppBar(userName: userName),
            const SizedBox(height: 100),
            HomeCategoryButtons(
              title: 'ترجمة',
              rightIcon: 'assets/images/text_icon.png',
              leftIcon: 'assets/images/video_icon.png',
              rightOnPressed: () {
                GoRouter.of(context).push(AppRouter.kTestScreen);
              },
              leftOnPressed: () {
                GoRouter.of(context).push(AppRouter.kTestScreen);
              },
            ),
            const SizedBox(height: 30),
            HomeCategoryButtons(
              title: 'تعليم',
              rightIcon: 'assets/images/test_icon.png',
              leftIcon: 'assets/images/content_icon.png',
              rightOnPressed: () {
                GoRouter.of(context).push(AppRouter.kTestScreen);
              },
              leftOnPressed: () {
                GoRouter.of(context).push(AppRouter.kLearningContentScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
