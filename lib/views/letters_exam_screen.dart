import 'package:flutter/material.dart';
import 'package:mafhom_app/widgets/content_app_bar.dart';
import 'package:mafhom_app/widgets/letters_exam_section.dart';

class LettersExamScreen extends StatelessWidget {
  LettersExamScreen({super.key});
  final List<Map<String, String>> mcqItems = [
    {
      'text': "- أي من الاختيارات التالية يمثل الحرف (ب):",
      'image1': "assets/images/im.png",
      'image2': "assets/images/hh.png",
      'image3': "assets/images/image.png",
    },
    {
      'text': "- أي من الاختيارات التالية يمثل الحرف (ع):",
      'image1': "assets/images/hh.png",
      'image2': "assets/images/image.png",
      'image3': "assets/images/im.png",
    },
    {
      'text': "- أي من الاختيارات التالية يمثل الحرف (ع):",
      'image1': "assets/images/hh.png",
      'image2': "assets/images/image.png",
      'image3': "assets/images/im.png",
    },
  ];
  final List<Map<String, String>> camItems = [
    {'text': "- افتح الكاميرا وقم بتمثيل  الحرف (ع):"},
    {'text': "- افتح الكاميرا وقم بتمثيل  الحرف (ع):"},
    {'text': "- افتح الكاميرا وقم بتمثيل  الحرف (ع):"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ContentAppBar(text: 'الحروف الأبجدية'),

      body: LettersExamSection(mcqItems: mcqItems, camItems: camItems),
    );
  }
}

