import 'package:flutter/material.dart';
import 'content_category_item.dart';

class ContentSection extends StatelessWidget {
  ContentSection({super.key});
  final List<String> categories = ["الحروف الأبجدية", "الأرقام", "الكلمات"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ContentCategoryItem(text: categories[index]);
        },
      ),
    );
  }
}
