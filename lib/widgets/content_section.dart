import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tawasel/helper/app_router.dart';
import 'content_category_item.dart';

class ContentSection extends StatelessWidget {
  ContentSection({super.key});
  final List<Map<String, dynamic>> categories = [
    {"title": "الحروف الأبجدية", "page": AppRouter.kLettersScreen},
    {"title": "الأرقام", "page": AppRouter.kNumberScreen},
    {"title": "الكلمات", "page": AppRouter.kTestScreen},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ContentCategoryItem(
            text: categories[index]['title'],
            onTap: () {
              GoRouter.of(context).push(categories[index]["page"]);
            },
          );
        },
      ),
    );
  }
}
