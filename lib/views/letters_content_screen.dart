import 'package:flutter/material.dart';
import 'package:tawasel/widgets/custom_app_bar.dart';

import '../widgets/sign_content.dart';

class LettersScreen extends StatelessWidget {
  LettersScreen({super.key});
  final List<Map<String, String>> letterItems = [
    {'mediaPath': 'assets/images/logo.png', 'text': 'أ'},
    {'mediaPath': 'assets/images/logo.png', 'text': 'ب'},
    {'mediaPath': 'assets/images/logo.png', 'text': 'ت'},
    {'mediaPath': 'assets/images/logo.png', 'text': 'ث'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ContentAppBar(text: "الحروف الأبجدية"),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 8),
        child: SignContent(itemsCount: 2, items: letterItems),
      ),
    );
  }
}
