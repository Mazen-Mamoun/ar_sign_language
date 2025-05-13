import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tawasel/helper/app_router.dart';
import 'package:tawasel/widgets/home_widgets/home_card_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HomeCardItem> homeCardItems = [
      HomeCardItem(
          width: MediaQuery.of(context).size.width * 0.9,
          title: 'ترجمة فيديو',
          icon: Icons.videocam,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kVideoTranselateView);
          }),
      HomeCardItem(
          width: MediaQuery.of(context).size.width * 0.4,
          title: 'المحتوي التعليمي',
          icon: Icons.description,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kLearningContentScreen);
          }),
      HomeCardItem(
          width: MediaQuery.of(context).size.width * 0.4,
          title: 'اختبارات',
          icon: Icons.check_box,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kExamScreen);
          }),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(indent: 10, endIndent: 10),
        Text(
          'ترجمه',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            homeCardItems[0],
          ],
        ),
        const SizedBox(height: 10),
        Text(
          'تعليم',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            homeCardItems[1],
            homeCardItems[2],
          ],
        ),
      ],
    );
  }
}
