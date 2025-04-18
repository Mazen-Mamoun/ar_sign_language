import 'package:flutter/material.dart';
import 'package:tawasel/helper/app_utils.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.prefixIcon,
    this.suffixIcon,
    required this.validatorText,
    this.suffixIconOnPressed,
    required this.obscureText,
    this.onChanged,
    this.filledCollor,
  });

  final String title, validatorText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final void Function()? suffixIconOnPressed;
  final bool obscureText;
  final Function(String)? onChanged;
  final bool? filledCollor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return validatorText;
        }
        return null;
      },
      decoration: InputDecoration(
        label: Text(
          title,
          style: TextStyle(color: Colors.grey.shade500),
        ),
        alignLabelWithHint: true,
        prefixIcon: Icon(prefixIcon, color: Colors.grey.shade500),
        suffixIcon: suffixIcon,
        fillColor: Colors.grey.shade100,
        filled: filledCollor,
        focusedBorder: customOutlineInputBorder(),
        enabledBorder: customOutlineInputBorder(),
        border: customOutlineInputBorder(),
      ),
    );
  }
}
