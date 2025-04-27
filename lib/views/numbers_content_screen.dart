import 'package:flutter/material.dart';
import 'package:tawasel/widgets/content_app_bar.dart';

import '../widgets/sign_content.dart';

class NumbersScreen extends StatelessWidget {
 const NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar:  ContentAppBar(text: "الأرقام"),
        body: Padding(
          padding:
               EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 8),
          child: SignContent(itemsCount: 2,  categoryName: 'number',),
        ),
      ),
    );
  }
}
