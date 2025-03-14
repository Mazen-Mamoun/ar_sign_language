import 'package:flutter/material.dart';
import 'package:tawasel/helper/constants.dart';

class AuthNavigationText extends StatelessWidget {
  const AuthNavigationText({
    super.key,
    required this.text,
    required this.textButton,
    this.onTap,
  });

  final String text;
  final String textButton;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            textButton,
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
