import 'package:flutter/material.dart';
import 'package:sign_app/Widgets/profile_icon.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '"$userName" مرحباً',
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        const SizedBox(width: 12),
        const ProfileIcon(),
      ],
    );
  }
}
