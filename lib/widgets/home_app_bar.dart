import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '"$userName" مرحباً',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 12),
          const Image(
            image: AssetImage('assets/images/profile_icon.png'),
            height: 48,
          ),
        ],
      ),
    );
  }
}
