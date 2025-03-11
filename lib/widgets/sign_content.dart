import 'package:flutter/material.dart';

import 'sign_item.dart';

class SignContent extends StatelessWidget {
  const SignContent({super.key, required this.items, required this.itemsCount});
  final List<Map<String, String>> items;
  final int itemsCount;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: itemsCount, crossAxisSpacing: 20, mainAxisSpacing: 20),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return SignItem(
                mediaPath: items[index]['mediaPath'] ?? "assets/images/logo.png",
                text: items[index]['text'] ?? "not found");
          }),
    );
  }
}
