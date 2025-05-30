import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tawasel/Models/exam_models/exam_model.dart';
import 'package:tawasel/widgets/exam_widgets/mcq_section.dart';

class LettersExamSection extends StatelessWidget {
  const LettersExamSection({super.key, required this.mcqItems});

  final List<ExamModel> mcqItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'اختر الحرف الصحيح بناء على الإشارة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              McqSection(items: mcqItems),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
