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
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 8),
        child: Column(
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            Expanded(
                child: SignContent(
              items: numberItems,
            )),
          ],
        ),
      ),
    );
  }
}
