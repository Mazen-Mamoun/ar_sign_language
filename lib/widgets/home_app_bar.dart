import 'package:flutter/material.dart';
import 'package:tawasel/widgets/profile_icon.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'مرحبا بك،',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const ProfileIcon(),
          ],
        ),
        const Text(
          'Ziad Alaa',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
