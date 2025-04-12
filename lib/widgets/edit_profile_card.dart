import 'package:flutter/material.dart';
import 'package:tawasel/Models/auth_models/auth_api_success_response_model.dart';
import 'package:tawasel/widgets/auth_widgets/log_in_body.dart';
import 'package:tawasel/widgets/edit_card_button.dart';
import 'package:tawasel/widgets/edit_card_text_field.dart';

class EditProfileCard extends StatelessWidget {
  const EditProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(Icons.edit_note),
                SizedBox(width: 10),
                Text(
                  'تعديل البيانات الشخصية',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            EditCardTextField(
              title: 'اسم المستخدم:',
              textFieldData: userData!.user.email,
            ),
            const SizedBox(height: 10),
            EditCardTextField(
              title: 'اسم المستخدم:',
              textFieldData: userData!.user.name,
            ),
            const SizedBox(height: 15),
            const EditCardButton(),
          ],
        ),
      ),
    );
  }
}
