import 'package:flutter/material.dart';
import 'package:tawasel/widgets/edit_card_button.dart';
import 'package:tawasel/widgets/edit_card_text_field.dart';

class EditProfileCard extends StatelessWidget {
  const EditProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      shadowColor: Colors.grey,
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.edit_note),
                SizedBox(width: 10),
                Text(
                  'تعديل البيانات الشخصية',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            EditCardTextField(
              title: 'اسم المستخدم:',
              textFieldData: 'Ziadalaa955@gmail.com',
            ),
            SizedBox(height: 10),
            EditCardTextField(
              title: 'كلمة المرور:',
              textFieldData: '123465789',
            ),
            SizedBox(height: 15),
            EditCardButton(),
          ],
        ),
      ),
    );
  }
}
