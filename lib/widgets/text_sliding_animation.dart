import 'package:flutter/material.dart';

class TextSlideAnimation extends StatelessWidget {
  const TextSlideAnimation({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slidingAnimation,
      child: const Text(
        '  لترجمة لغة الإشارة',
        style: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
