import 'package:flutter/widgets.dart';
import 'package:mafhom_app/widgets/camera_section.dart';

class WordsExamSection extends StatelessWidget {
  const WordsExamSection({
    super.key,
    required this.camItems,
  });

  final List<Map<String, String>> camItems;

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
              Text(
                "تمثيل الحرف المطلوب:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              CameraSection(items: camItems),
            ],
          ),
        ),
      ),
    );
  }
}
