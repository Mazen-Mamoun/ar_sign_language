import 'package:flutter/material.dart';

class EditCardTextField extends StatelessWidget {
  const EditCardTextField({
    super.key,
    required this.title,
    required this.textFieldData,
    required this.validatorText,
    this.onChanged,
  });

  final String title;
  final String textFieldData;
  final String validatorText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 55,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return validatorText;
              }
              return null;
            },
            onChanged: onChanged,
            controller: TextEditingController(text: textFieldData),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        //  const Spacer(),
      ],
    );
  }
}
