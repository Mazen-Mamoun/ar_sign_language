import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mafhom_app/helper/app_router.dart';
import 'content_category_item.dart';

class ContentSection extends StatelessWidget {
  ContentSection({super.key, required this.id});
  final String id;
  final List<Map<String, dynamic>> categoriesLearn = [
    {"title": "الحروف الأبجدية", "page": AppRouter.kLettersScreen},
    {"title": "الأرقام", "page": AppRouter.kNumberScreen},
    {"title": "الكلمات", "page": AppRouter.kWordsScreen},
  ];

  final List<Map<String, dynamic>> categoriesExam = [
    {"title": "الحروف الأبجدية", "page": AppRouter.kLettersExamScreen},
    {"title": "الأرقام", "page": AppRouter.kNumbersExamScreen},
    {"title": "الكلمات", "page": AppRouter.kWordsExamScreen},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
      child: ListView.builder(
        itemCount: categoriesLearn.length,
        itemBuilder: (context, index) {
          return ContentCategoryItem(
            text: categoriesLearn[index]['title'],
            onTap: () {
              switch (id) {
                case 'المحتوى':
                  GoRouter.of(context).push(categoriesLearn[index]["page"]);
                 break;
                case 'الإختبار':
                  GoRouter.of(context).push(categoriesExam[index]["page"]);
                  break;
              }
            },
          );
        },
      ),
    );
  }
}
