import 'package:flutter/material.dart';
import 'package:mafhom_app/widgets/content_app_bar.dart';
import 'package:mafhom_app/widgets/numbers_exam_section.dart';

class NumbersExamScreen extends StatelessWidget {
  NumbersExamScreen({super.key});
  final List<Map<String, String>> mcqItems = [
    {
      'text': "- أي من الاختيارات التالية يمثل الرقم (1):",
      'image1': "assets/images/im.png",
      'image2': "assets/images/hh.png",
      'image3': "assets/images/image.png",
    },
    {
      'text': "- أي من الاختيارات التالية يمثل الرقم (2):",
      'image1': "assets/images/hh.png",
      'image2': "assets/images/image.png",
      'image3': "assets/images/im.png",
    },
  ];
  final List<Map<String, String>> camItems = [
    {'text': "- افتح الكاميرا وقم بتمثيل  الرقم (1):"},
    {'text': "- افتح الكاميرا وقم بتمثيل  الرقم (2):"},
    {'text': "- افتح الكاميرا وقم بتمثيل  الرقم (5):"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ContentAppBar(text: 'الأرقام'),

      body: NumbersExamSection(mcqItems: mcqItems, camItems: camItems),
    );
  }
}

