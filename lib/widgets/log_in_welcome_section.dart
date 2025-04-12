import 'package:flutter/material.dart';
import 'package:tawasel/helper/constants.dart';

class LogInWelcomeSection extends StatelessWidget {
  const LogInWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/login_image.png",
          height: 250,
        ),
        Text(
          "مرحبا بك في تواصل",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 27,
            fontWeight: FontWeight.bold,
            shadows: const [Shadow(blurRadius: 1)],
          ),
        ),
        const SizedBox(height: 5),
        const Opacity(
          opacity: 0.7,
          child: Text(
            "ترجمة لغه الاشارة الى كلمه والكلمه الى لغة الاشارة..",
            style: TextStyle(
              color: Color(0xff6E6E7C),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
