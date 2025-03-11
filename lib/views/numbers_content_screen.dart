import 'package:flutter/material.dart';
import 'package:tawasel/widgets/custom_app_bar.dart';

import '../widgets/sign_content.dart';

class NumbersScreen extends StatelessWidget {
  NumbersScreen({super.key});
  final List<Map<String, String>> numberItems = [
    {'image': 'assets/images/logo.png', 'text': "1"},
    {'image': 'assets/images/logo.png', 'text': "2"},
    {'image': 'assets/images/logo.png', 'text': "3"},
    {'image': 'assets/images/logo.png', 'text': "4"},
    {'image': 'assets/images/logo.png', 'text': "4"},
    {'image': 'assets/images/logo.png', 'text': "4"},
    {'image': 'assets/images/logo.png', 'text': "4"},
    {'image': 'assets/images/logo.png', 'text': "4"},
  ];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: const ContentAppBar(text: "الأرقام"),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 8),
        child: SignContent(itemsCount: 2, items: numberItems),
      ),
    );
  }
}
