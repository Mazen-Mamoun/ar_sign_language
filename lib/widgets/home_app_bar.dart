import 'package:flutter/material.dart';
import 'package:tawasel/Models/auth_models/auth_api_success_response_model.dart';
import 'package:tawasel/Models/auth_models/user_model.dart';
import 'package:tawasel/widgets/auth_widgets/log_in_body.dart';
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
        Text(
          userData!.user.name,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
