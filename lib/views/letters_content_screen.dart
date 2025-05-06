import 'package:flutter/material.dart';
import 'package:tawasel/widgets/content_app_bar.dart';

import '../widgets/sign_content.dart';

class LettersScreen extends StatelessWidget {
  const LettersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar:  ContentAppBar(text: "الحروف الأبجدية"),
        body: Padding(
          padding:
               EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 8),
          child: SignContent(crossAxisCount: 2, categoryName: 'letter',),
        ),
      ),
    );
  }
}
