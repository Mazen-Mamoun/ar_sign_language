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
          title: 'كلمة',
          icon: Icons.wordpress,
          onTap: () {
            GoRouter.of(context)
                .push('${AppRouter.kVideoTranselateView}?mode=word');
          }),
      HomeCardItem(
          title: 'حرف',
          icon: Icons.abc_rounded,
          onTap: () {
            GoRouter.of(context)
                .push('${AppRouter.kVideoTranselateView}?mode=letter');
          }),
      HomeCardItem(
          title: 'رقم',
          icon: Icons.pin_outlined,
          onTap: () {
            GoRouter.of(context)
                .push('${AppRouter.kVideoTranselateView}?mode=number');
          }),
      HomeCardItem(
          title: 'المحتوي التعليمي',
          icon: Icons.description,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kLearningContentScreen);
          }),
      HomeCardItem(
          title: 'اختبارات',
          icon: Icons.check_box,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kExamScreen);
          }),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ترجمه',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
Expanded(child: homeCardItems[0]),
            Expanded(child: homeCardItems[1]),
            Expanded(child: homeCardItems[2]),       
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
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Expanded(child: homeCardItems[3]),
          Expanded(child: homeCardItems[4]),
          ],
        ),
      ],
    );
  }
}
