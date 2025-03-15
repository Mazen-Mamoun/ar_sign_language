import 'package:flutter/material.dart';
import 'package:mafhom_app/widgets/camera_item.dart';

class CameraSection extends StatelessWidget {
  const CameraSection({super.key, required this.items});
  final List<Map<String, dynamic>> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, 
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (buildContext, index) {
        return CameraItem(text: items[index]["text"]);
      },
    );
  }
}
