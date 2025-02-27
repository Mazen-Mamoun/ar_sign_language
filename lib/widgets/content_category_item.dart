import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tawasel/helper/app_router.dart';

class ContentCategoryItem extends StatelessWidget {
  const ContentCategoryItem({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kTestScreen);
        },
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
                    fontFamily: "Poppins",
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
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
