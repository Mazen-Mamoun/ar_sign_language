import 'package:flutter/material.dart';
import 'package:tawasel/helper/constants.dart';

class CusotmAuthButton extends StatelessWidget {
  const CusotmAuthButton({
    super.key,
    required this.form,
    required this.onPressed,
    required this.title,
  });

  final GlobalKey<FormState> form;
  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
