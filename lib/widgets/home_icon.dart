import 'package:flutter/material.dart';
import 'package:sign_app/constants.dart';

class CategoryIconButton extends StatelessWidget {
  const CategoryIconButton({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.09,
          vertical: MediaQuery.of(context).size.height * 0.012,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: primaryColor,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.11,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
