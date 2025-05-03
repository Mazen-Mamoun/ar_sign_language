import 'package:flutter/material.dart';

class ClosedCameraWidget extends StatelessWidget {
  const ClosedCameraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const AspectRatio(
          aspectRatio: 1 / 1.3,
          child: Center(
            child: Text(
              'الكاميرا مغلقة',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
