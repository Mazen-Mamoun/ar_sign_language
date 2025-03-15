import 'package:flutter/material.dart';
import 'package:mafhom_app/constants.dart';

class CameraItem extends StatelessWidget {
  const CameraItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            // "- افتح الكاميرا وقم بتمثيل  الحرف (ع):",
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.video_camera_back, size: 28),
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () {},
            child: Text(
              "إبدأ الأن",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
