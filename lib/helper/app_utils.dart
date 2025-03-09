import 'package:flutter/material.dart';

OutlineInputBorder customOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.shade100,
    ),
    borderRadius: BorderRadius.circular(25),
  );
}

void snackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(content)),
  );
}
