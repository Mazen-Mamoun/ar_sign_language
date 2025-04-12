import 'package:flutter/material.dart';
import 'package:tawasel/helper/constants.dart';
import 'package:tawasel/widgets/auth_widgets/log_in_body.dart';

class ProfileNameContainer extends StatelessWidget {
  const ProfileNameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.elliptical(400, 100),
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            userData!.user.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            userData!.user.email,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}
