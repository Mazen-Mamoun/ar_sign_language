import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_app/constants.dart';
import 'package:sign_app/helper/app_router.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: primaryColor,
      ),
      child: IconButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kTestScreen);
        },
        icon: const Icon(Icons.person, size: 35, color: Colors.white),
      ),
    );
  }
}
