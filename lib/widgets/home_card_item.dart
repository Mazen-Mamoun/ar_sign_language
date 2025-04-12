import 'package:flutter/material.dart';
import 'package:tawasel/helper/constants.dart';

class HomeCardItem extends StatelessWidget {
  const HomeCardItem({
    super.key,
    required this.title,
    this.onTap,
    required this.icon,
  });

  final String title;
  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Card(
          elevation: 20,
          shadowColor: const Color(0xff374E7A),
          color: kPrimaryColor,
          child: Column(
            children: [
              const Spacer(flex: 2),
              Icon(icon, size: 60, color: Colors.white),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff374E7A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12)
            ],
          ),
        ),
      ),
    );
  }
}
