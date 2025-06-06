
import 'package:flutter/material.dart';
import 'package:tawasel/helper/constants.dart';
import 'package:tawasel/models/content_model/item_model.dart';
import 'package:tawasel/widgets/sign_video_item.dart';


class SignItem extends StatelessWidget {
  const SignItem({super.key, required this.itemModel});
  final ItemModel itemModel;
  @override
  Widget build(BuildContext context) {
   
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             AspectRatio(
                    aspectRatio: 1.2,
                    child: // عرض الصورة المحفوظة محليًا
                        itemModel.localImagePath != null
                            ? Image.file(File(itemModel.localImagePath!))
                            : const Text("لا توجد صورة"),
                  ),
            const SizedBox(height: 10),
            Text(
              itemModel.text,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
