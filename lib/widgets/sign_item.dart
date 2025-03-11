import 'package:flutter/material.dart';
import 'package:mafhom_app/widgets/sign_video_item.dart';

class SignItem extends StatelessWidget {
  const SignItem({super.key, required this.mediaPath, required this.text});
  final String mediaPath;
  final String text;
  @override
  Widget build(BuildContext context) {
    bool isVideo = mediaPath.endsWith('.mp4');
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isVideo
                // ? Text("data")
                ? SignVideoItem(videoPath: mediaPath)
                : Image.asset(mediaPath, height: 85),
            const SizedBox(height: 15),
            Text(
              text,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
