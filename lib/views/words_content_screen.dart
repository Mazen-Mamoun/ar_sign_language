import 'package:flutter/material.dart';
import 'package:tawasel/widgets/content_app_bar.dart';

import '../widgets/sign_content.dart';

class WordsScreen extends StatelessWidget {
  WordsScreen({super.key});
  final List<Map<String, String>> wordItems = [
    {'mediaPath': 'assets/numbers_video.mp4', 'text': 'تجربة'},
    {'mediaPath': 'assets/numbers_video.mp4', 'text': 'تجربة'},
    {'mediaPath': 'assets/numbers_video.mp4', 'text': 'تجربة'},
    {'mediaPath': 'assets/numbers_video.mp4', 'text': 'تجربة'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ContentAppBar(text: "الكلمات"),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, right: 16, left: 16, bottom: 8),
        child: SignContent(itemsCount: 1, items: wordItems),
      ),
    );
  }
}
