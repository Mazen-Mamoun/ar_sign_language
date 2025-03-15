import 'package:flutter/material.dart';
import 'package:mafhom_app/widgets/content_app_bar.dart';
import 'package:mafhom_app/widgets/words_exam_section.dart';

class WordsExamScreen extends StatelessWidget {
  WordsExamScreen({super.key});
  final List<Map<String, String>> camItems = [
    {'text': "- افتح الكاميرا وقم بتمثيل  كلمة (مرحبا):"},
    {'text': "- افتح الكاميرا وقم بتمثيل  الحرف (يشرب):"},
    {'text': "- افتح الكاميرا وقم بتمثيل  الحرف (ينام):"},
    {'text': "- افتح الكاميرا وقم بتمثيل  الحرف (يأكل):"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ContentAppBar(text: 'الكلمات'),

      body: WordsExamSection(camItems: camItems),
    );
  }
}

