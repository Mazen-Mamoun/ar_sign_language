import 'package:flutter/material.dart';

class HomeCategoryButtons extends StatelessWidget {
  const HomeCategoryButtons({
    super.key,
    required this.title,
    required this.rightIcon,
    required this.leftIcon,
    required this.rightOnPressed,
    required this.leftOnPressed,
  });

  final String title, rightIcon, leftIcon;
  final void Function() rightOnPressed, leftOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 50),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: leftOnPressed,
                icon: Image(image: AssetImage(leftIcon)),
              ),
              IconButton(
                onPressed: rightOnPressed,
                icon: Image(image: AssetImage(rightIcon)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
