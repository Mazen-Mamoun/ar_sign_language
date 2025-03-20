import 'package:flutter/material.dart';
import 'package:sign_app/Widgets/home_app_bar.dart';
import 'package:sign_app/Widgets/home_body.dart';

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
                SizedBox(height: 20),
                HomeBody(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MainBottomNavigationBar(currentIndex: 2),
    );
  }
}
