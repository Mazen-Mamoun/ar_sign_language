import 'package:flutter/material.dart';

class EditCardTextField extends StatelessWidget {
  const EditCardTextField({
    super.key,
    required this.title,
    required this.textFieldData,
  });

  final String title;
  final String textFieldData;

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
          child: TextField(
            controller: TextEditingController(text: textFieldData),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        //  const Spacer(),
      ],
    );
  }
}
