import 'package:flutter/material.dart';
import 'package:sign_app/Widgets/home_app_bar.dart';
import 'package:sign_app/Widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final String userName = 'Ziad';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
          child: Column(
            children: [
              HomeAppBar(userName: userName),
              const SizedBox(height: 100),
              const HomeBody(),
            ],
          ),
        ),
      ),
    );
  }
}
