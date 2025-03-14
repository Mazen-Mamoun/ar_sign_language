import 'package:flutter/material.dart';

class CustomerSupportCard extends StatelessWidget {
  const CustomerSupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 10),
                Text(
                  'الدعم',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.sms),
                SizedBox(width: 10),
                Text(
                  'تواصل معنا',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
