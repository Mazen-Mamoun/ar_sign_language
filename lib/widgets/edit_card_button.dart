import 'package:flutter/material.dart';
import 'package:tawasel/helper/app_utils.dart';
import 'package:tawasel/helper/constants.dart';

class EditCardButton extends StatelessWidget {
  const EditCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        snackBar(context, 'تم التعديل بنجاح');
      },
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'تعديل البيانات',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
