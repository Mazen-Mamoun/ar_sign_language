import 'package:flutter/widgets.dart';

class McqItem extends StatelessWidget {
  const McqItem({
    super.key,
    required this.text,
    required this.image1,
    required this.image2,
    required this.image3,
  });
  final String text;
  final String image1;
  final String image2;
  final String image3;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(image1, height: 50),
            Image.asset(image2, height: 50),
            Image.asset(image3, height: 50),
          ],
        ),
      ],
    );
  }
}
