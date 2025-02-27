import 'package:flutter/material.dart';
import 'package:sign_app/Widgets/text_sliding_animation.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(height: 110, image: AssetImage('assets/images/logo.png')),
            Text(
              'تواصُل',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        TextSlideAnimation(slidingAnimation: slidingAnimation),
      ],
    );
  }
}
