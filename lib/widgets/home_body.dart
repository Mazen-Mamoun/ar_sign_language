import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_app/Widgets/home_buttons_row.dart';
import 'package:sign_app/helper/app_router.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'ترجمة',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 50),
        ),
        const SizedBox(height: 10),
        HomeButtonsRow(
          leftButtonTitle: 'نص',
          rightButtonTitle: 'فيديو',
          leftButtonIcon: Icons.notes,
          rightButtonIcon: Icons.videocam,
          leftOnTap: () {
            GoRouter.of(context).push(AppRouter.kTestScreen);
          },
          rightOnTap: () {
            GoRouter.of(context).push(AppRouter.kTestScreen);
          },
        ),
        const SizedBox(height: 20),
        const Text(
          'تعليم',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 50),
        ),
        const SizedBox(height: 10),
        HomeButtonsRow(
          leftButtonTitle: 'المحتوي',
          rightButtonTitle: 'الاختبار',
          leftButtonIcon: Icons.description,
          rightButtonIcon: Icons.check_box,
          leftOnTap: () {
            GoRouter.of(context).push(AppRouter.kLearningContentScreen);
          },
          rightOnTap: () {
            GoRouter.of(context).push(AppRouter.kTestScreen);
          },
        ),
      ],
    );
  }
}
