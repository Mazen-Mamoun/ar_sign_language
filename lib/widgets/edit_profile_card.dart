import 'package:flutter/material.dart';

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
            Row(
              children: [
                const Text(
                  'اسم المستخدم:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                //  const Spacer(),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'كلمة المرور:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                const Spacer(),
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                //const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
