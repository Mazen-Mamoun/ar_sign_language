import 'package:flutter/material.dart';
import 'package:tawasel/widgets/home_app_bar.dart';
import 'package:tawasel/widgets/home_body.dart';
import 'package:tawasel/widgets/main_bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            child: Column(
              children: [
                HomeAppBar(),
                 Divider(indent: 10, endIndent: 10),
                 Spacer(),
                HomeBody(),
                 Spacer(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MainBottomNavigationBar(currentIndex: 1),
    );
  }
}
