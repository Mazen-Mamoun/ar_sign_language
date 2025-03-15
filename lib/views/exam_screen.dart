import 'package:flutter/material.dart';
import 'package:mafhom_app/widgets/content_app_bar.dart';
import 'package:mafhom_app/widgets/content_section.dart';


class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const ContentAppBar(text: 'الإختبار'),
            Expanded(child: ContentSection(id: "الإختبار",)),
          ],
        ),
      ),
    );
  }
}
