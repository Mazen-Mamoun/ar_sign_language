import 'package:flutter/widgets.dart';
import 'package:mafhom_app/widgets/mcq_item.dart';

class McqSection extends StatelessWidget {
  const McqSection({super.key, required this.items});
  final List<Map<String, dynamic>> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (buildContext, index) {
        return McqItem(
          text: items[index]['text'],
          image1: items[index]['image1'],
          image2: items[index]['image2'],
          image3: items[index]['image3'],
        );
      },
    );
  }
}
