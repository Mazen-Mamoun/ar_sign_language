import 'package:flutter/material.dart';

class ContentCategoryItem extends StatelessWidget {
  const ContentCategoryItem(
      {super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 85,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xff648DDB)),
          child: Stack(
            textDirection: TextDirection.rtl,
            alignment: AlignmentDirectional.centerStart,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  text,
                  style: const TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w600,
    fontFamily: "Poppins",
  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
