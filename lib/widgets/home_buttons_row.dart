import 'package:flutter/material.dart';
import 'package:sign_app/Widgets/home_icon.dart';

class HomeButtonsRow extends StatelessWidget {
  const HomeButtonsRow({
    super.key,
    required this.leftButtonTitle,
    required this.rightButtonTitle,
    required this.leftButtonIcon,
    required this.rightButtonIcon,
    this.leftOnTap,
    this.rightOnTap,
  });

  final String leftButtonTitle, rightButtonTitle;
  final IconData leftButtonIcon, rightButtonIcon;
  final void Function()? leftOnTap, rightOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryIconButton(
          title: leftButtonTitle,
          icon: leftButtonIcon,
          onTap: leftOnTap,
        ),
        CategoryIconButton(
          title: rightButtonTitle,
          icon: rightButtonIcon,
          onTap: rightOnTap,
        ),
      ],
    );
  }
}
