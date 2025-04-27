import 'package:flutter/widgets.dart';
import 'package:tawasel/models/content_model/item_model.dart';
import 'package:tawasel/widgets/sign_item.dart';


class ContentSuccessState extends StatelessWidget {
  const ContentSuccessState({
    super.key,
    required this.itemsCount,
    required this.items,
  });

  final int itemsCount;
  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: itemsCount,
          childAspectRatio: 0.75,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return SignItem(itemModel: items[index]);
        },
      ),
    );
  }
}
