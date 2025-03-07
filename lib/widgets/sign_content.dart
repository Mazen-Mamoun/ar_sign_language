import 'package:flutter/material.dart';

import 'sign_item.dart';

class SignContent extends StatelessWidget {
  const SignContent({super.key, required this.items});
  final List<Map<String, String>> items;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return SignItem(
                image: items[index]['image'] ?? "assets/images/logo.png",
                text: items[index]['text'] ?? "not found");
          }),
    );
  }
}
