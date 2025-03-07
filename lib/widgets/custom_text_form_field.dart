import 'package:flutter/material.dart';
import 'package:tawasel/helper/app_utils.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.preficIcon,
    this.suffixIcon,
    required this.validatorText,
  });

  final String title, validatorText;
  final IconData preficIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return validatorText;
        }
        return null;
      },
      decoration: InputDecoration(
        label: Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
        alignLabelWithHint: true,
        prefixIcon: Icon(
          preficIcon,
          color: Colors.grey.shade500,
        ),
        suffixIcon: Icon(
          suffixIcon,
          color: Colors.grey.shade500,
        ),
        fillColor: Colors.grey.shade100,
        filled: true,
        focusedBorder: customOutlineInputBorder(),
        enabledBorder: customOutlineInputBorder(),
        border: customOutlineInputBorder(),
      ),
    );
  }
}
